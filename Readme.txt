Entry for Inf1–FP Programming Competition 2015
--Stylianos Milisavljevic 
--Marticulation Number: s1509375
This program generates a 3D Greek cross fractal using OpenGL (included in the latest versions of Haskell) 
with {n: 1 <= n <= 6} dimensions and with additional representations using cubes. 
To run this program, you should compile the file MyCrosses.hs using the "ghc --make MyCrosses.hs" command while in the same directory with the file.
Note: All the files must be in the same directory. (MyCrosses.hs, Bindings.hs, Display.hs, Cross.hs, Points.hs)
Controls:
W,A,S,D     : Rotate the fractal
Arrow keys  : Move the fractal
Q,E         : Zoom in and out
+,-         : Increase and decrease the speed of the rotational animation 
Space       : Pause / reset the rotational animation
Z,C         : Increase and decrease the number of dimensions (n)
X           : Cycle through different representations of the fractal (Crosses, Cubes, Triangles in Cube formation)