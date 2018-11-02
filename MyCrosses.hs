{-
Entry for Inf1–FP Programming Competition 2015
--Stylianos Milisavljevic 
--Marticulation Number: s1509375
This program generates a 3D Greek cross fractal using OpenGL (included in the latest versions of Haskell) 
with {n: 1 <= n <= 6} dimensions and with additional representations using cubes. 
To run this program, you should compile the file MyCrosses.hs using the ghc --make MyCrosses.hs command while in the same directory with the file.
Note: All the files must be in the same directory. (MyCrosses.hs, Bindings.hs, Display.hs, Cross.hs, Points.hs)
Controls:
W,A,S,D     : Rotate the fractal
Arrow keys  : Move the fractal
Q,E         : Zoom in and out
+,-         : Increase and decrease the speed of the rotational animation 
Space       : Pause / reset the rotational animation
Z,C         : Increase and decrease the number of dimensions (n)
X           : Cycle through different representations of the fractal (Crosses, Cubes, Triangles in Cube formation)
-}

import Graphics.UI.GLUT
import Data.IORef
import Bindings
 
main :: IO ()
main = do
  (_progName, _args) <- getArgsAndInitialize
  initialDisplayMode $= [WithDepthBuffer, DoubleBuffered]
  _window <- createWindow "3D Greek Cross - Stylianos Milisavljevic"
  reshapeCallback $= Just reshape
  windowSize $= Size 500 500 --Window size
  depthFunc $= Just Less -- the comparison function for depth the buffer
  angle <- newIORef ((35,0)::(GLfloat,GLfloat))
  delta <- newIORef 0.01
  zoom <- newIORef (1::GLfloat)
  pos <- newIORef (0, 0)
  n <- newIORef  2 --Starting N 
  s <- newIORef 0 --Starting state of the figures drawn
  keyboardMouseCallback $= Just (keyboardMouse angle delta zoom pos n s)
  idleCallback $= Just (idle angle delta)
  displayCallback $= display angle zoom pos n s
  mainLoop