! ***************************************************************************************************
!  Copyright (C) 2020-2023 GreenX library
!  This file is distributed under the terms of the APACHE2 License.
!
! ***************************************************************************************************

module gx_ac
  use kinds, only: dp
  use pade_approximant, only: evaluate_thiele_pade, thiele_pade
  implicit none

  public :: thiele_pade_api

contains

  !> API function to compute Thiele-Pade approximations of a meromorphic function
  !! @param[in] n_par - order of the interpolant
  !! @param[in] x_ref - array of the reference points
  !! @param[in] y_ref - array of the reference function values
  !! @param[in] x_query - array of points where the function needs to be evaluated
  !! @param[in] do_greedy - whether to use the default greedy algorithm or the naive one
  !! @param[out] y_query - array of the interpolated values at x_query
  subroutine thiele_pade_api(n_par, x_ref, y_ref, x_query, y_query, do_greedy)
    integer, intent(in)                            :: n_par
    complex(kind=dp), dimension(:), intent(in)     :: x_ref, y_ref, x_query
    complex(kind=dp), dimension(:), intent(out)    :: y_query
    logical, optional, intent(in)                  :: do_greedy

    ! Internal variables
    integer                                        :: i, num_query
    complex(kind=dp), dimension(size(x_ref))       :: x_ref_local
    complex(kind=dp), dimension(n_par)             :: a_par

    ! Compute the coefficients a_par
    x_ref_local = x_ref
    call thiele_pade(n_par, x_ref_local, y_ref, a_par, do_greedy)

    ! Compute the number of query points
    num_query = size(x_query)

    ! Evaluate the Thiele-Pade approximation at the query points
    do i = 1, num_query
       call evaluate_thiele_pade(n_par, x_ref_local, x_query(i), a_par, y_query(i))
    end do

  end subroutine thiele_pade_api

end module gx_ac
