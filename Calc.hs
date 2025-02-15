module Calc where

import Lexer 

calc :: Expr -> Expr
calc e = if fvalue e then e else calc (step e)

-- ! small step strategy 
step :: Expr -> Expr

step (Add (Num n1) (Num n2)) = Num (n1 + n2)
step (Add (Num n) e2)        = let e2' = step e2 in Add (Num n) e2'
step (Add e1 e2)             = Add (step e1) e2

step (Sub (Num n1) (Num n2)) = Num (n1 - n2)
step (Sub (Num n) e2)        = let e2' = step e2 in Sub (Num n) e2'
step (Sub e1 e2)             = Sub (step e1) e2

step (Mul (Num n1) (Num n2)) = Num (n1 * n2)
step (Mul (Num n) e2)        = let e2' = step e2 in Mul (Num n) e2'
step (Mul e1 e2)             = Mul (step e1) e2

step (Div (Num n1) (Num n2)) = Num (div n1 n2)
step (Div (Num n) e2)        = let e2' = step e2 in Div (Num n) e2'
step (Div e1 e2)             = Div (step e1) e2

step (Par e)       = step e 
step (SquBra e)    = step e
step (CurBra e)    = step e
-- ! small step strategy 

fvalue :: Expr -> Bool 
fvalue (Num n) = True 
fvalue e = False 