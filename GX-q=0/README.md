## GreenX library - q=0 
This is a code-agnostic component of Green-X, aimed at computing the inverse dielectric constant for 3D systems, and the screened Coulomb potential for 2D systems at q=0. It has been adapted to GPUs.

## Structure of the library
Workflow of IDieL, indicating its interaction with the parent/calling code, and the major procedures. \(H\)
\(W^{L}\), \(W^{U}\) and \(B\) stand for the head, lower wing, upper wing and body of the dielectric matrix, respectively.

<h1 align="center">
  <img src="./IDieL_structure.png" alt="IDieL_structure" width="500">
</h1>

## Building

With CMake, change to the GreenX root, then type:

```bash
mkdir build && cd build
cmake ../
make -j 
make install 
```

See the [GreenX website](https://nomad-coe.github.io/greenX/) for more details. 