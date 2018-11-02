module Bindings (idle, display, reshape, keyboardMouse) where
 
import Graphics.UI.GLUT
import Data.IORef
import Display

reshape :: ReshapeCallback
reshape size = do 
  viewport $= (Position 0 0, size)
 
--All the keyboard controls are handled here

keyboardMouse :: IORef (GLfloat,GLfloat) -> IORef GLfloat -> IORef GLfloat -> IORef (GLfloat, GLfloat) -> IORef GLint -> IORef GLint -> KeyboardMouseCallback
keyboardMouse a d z p n s key Down _ _ = case key of
  (Char ' ') -> d $~! (\delta -> if delta /= 0 then 0 else 0.01) --Makes delta 0 so the animation is paused / Resets animation to initial speed
  (Char '+') -> d $~! (\delta -> if delta < 2048 then delta * 2 else delta) --Increasing the speed of rotational animation up to a limit
  (Char '-') -> d $~! (/ 2) -- Decreasing the speed of rotational animation
  (Char 'w') -> a $~! \(x,y) -> (x-1,y)
  (Char 's') -> a $~! \(x,y) -> (x+1,y)
  (Char 'a') -> a $~! \(x,y) -> (x,y+1)
  (Char 'd') -> a $~! \(x,y) -> (x,y-1)
  (Char 'q') -> z $~! (* 1.1)
  (Char 'e') -> z $~! (* 0.9)
  (Char 'z') -> n $~! (\num -> if num > 1 then num - 1 else num) 
  (Char 'c') -> n $~! (\num -> if num < 6 then num + 1 else num) 
  (Char 'x') -> s $~! (\num -> (num + 1) `mod` 3) 
  (SpecialKey KeyLeft ) -> p $~! \(x,y) -> (x-0.1,y)
  (SpecialKey KeyRight) -> p $~! \(x,y) -> (x+0.1,y)
  (SpecialKey KeyUp   ) -> p $~! \(x,y) -> (x,y+0.1)
  (SpecialKey KeyDown ) -> p $~! \(x,y) -> (x,y-0.1)
  _ -> return ()
keyboardMouse _ _ _ _ _ _ _ _ _ _ = return ()
