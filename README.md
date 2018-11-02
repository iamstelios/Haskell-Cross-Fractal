# Haskell Cross Fractal

### Entry for Inf1–FP Programming Competition 2015

Generate 3D Greek cross fractal using OpenGL (included in the latest versions of Haskell) 
with {n: 1 <= n <= 6} dimensions and with additional representations using cubes. 

To run, should compile the file MyCrosses.hs using Haskell (`version 7.10.2` was used for this project)

> ghc --make MyCrosses.hs

### Controls:
```
W,A,S,D     : Rotate the fractal
Arrow keys  : Move the fractal
Q,E         : Zoom in and out
+,-         : Increase and decrease the speed of the rotational animation 
Space       : Pause / reset the rotational animation
Z,C         : Increase and decrease the number of dimensions (n)
X           : Cycle through different representations of the fractal (Crosses, Cubes, Triangles in Cube formation)
```

![screenshot](https://github.com/iamstelios/Haskell-Cross-Fractal/blob/master/3D%20greek%20cross%20fractal%20snaps.JPG?raw=true)
