module Points where
 
import Graphics.Rendering.OpenGL
 
pointstodraw :: GLint -> GLfloat -> [(GLfloat,GLfloat,GLfloat)]
pointstodraw n x = [(0,0,0)] ++ points (n-1) 0 0 0 x

--Each outer point of a cross is replaced by a cross formed by 6 segments.
points :: GLint -> GLfloat -> GLfloat -> GLfloat -> GLfloat -> [(GLfloat,GLfloat,GLfloat)]
points 0 x y z w = []
points n x y z w =[ ( x+w,  y,    z), 
                    ( x-w,  y,    z),
                    ( x,    y+w,  z),
                    ( x,    y-w,  z),
                    ( x,    y,    z+w),
                    ( x,    y,    z-w) ] 
                    ++ points (n-1) (x+w) (y)   (z)   w
                    ++ points (n-1) (x-w) (y)   (z)   w
                    ++ points (n-1) (x)   (y+w) (z)   w
                    ++ points (n-1) (x)   (y-w) (z)   w
                    ++ points (n-1) (x)   (y)   (z+w) w
                    ++ points (n-1) (x)   (y)   (z-w) w
