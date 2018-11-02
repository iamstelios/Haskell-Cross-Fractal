module Display (idle, display) where
 
import Graphics.UI.GLUT
import Control.Monad
import Data.IORef
import Cross
import Points

--Width of the lines of a cross / sides of a cube
w :: GLfloat
w = 0.1

display :: IORef (GLfloat,GLfloat) -> IORef GLfloat -> IORef (GLfloat, GLfloat) -> IORef GLint -> IORef GLint -> DisplayCallback
display angle zoom pos num state= do 
  clear [ColorBuffer, DepthBuffer] -- clear depth buffer, too
  clear [ColorBuffer]
  loadIdentity
  (x',y') <- get pos
  translate $ Vector3 x' y' 0
  z' <- get zoom
  preservingMatrix $ do
    (xa, ya) <- get angle
    --Adding the rotation animation
    rotate xa $ Vector3 1.0 0 0
    rotate ya $ Vector3 0 1.0 0 
    -- Handling the zoom
    scale z' z' z'
    n <- get num
    s <- get state
    forM_ (pointstodraw n w) $ \(x,y,z) -> preservingMatrix $ do
      color $ Color3 ((x+1)/2) ((y+1)/2) ((z+1)/2)
      translate $ Vector3 x y z
      case s of
        0 ->  do
              clearColor $= Color4 0 0 0 1 --Set background colour to black
              cross w --draw the crosses
        1 ->  do
              clearColor $= Color4 1 1 1 1 --Set background colour to white
              cube w --draw the cubes
              color $ Color3 (0::GLfloat) 0 0 -- set outline color to black
              cubeFrame w -- draw the outline
        2 ->  do
              clearColor $= Color4 1 1 1 1 --Set background colour to white
              triangles w --draw the triangles
              color $ Color3 (0::GLfloat) 0 0 -- set outline color to black
              cubeFrame w -- draw the outline
        _ ->  state $= 0

  swapBuffers

--Changing the angle so it rotates while idle in respect of delta (delta = 0 while paused)
idle :: IORef (GLfloat,GLfloat) -> IORef GLfloat -> IdleCallback
idle angle delta = do
  d <- get delta
  (xa, ya) <- get angle
  angle $= ((xa + d),(ya + d))
  postRedisplay Nothing
