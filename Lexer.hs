module Lexer where
import Data.Char

-- tokens 
data Token = TNum Int
    | TAdd
    | TSub
    | TMul
    | TDiv
    | TFac -- factorial
    | TOPar -- parentheses
    | TCPar
    | TOSquBra -- square brackets 
    | TCSquBra
    | TOCurBra -- curly brackets
    | TCCurBra
    deriving (Show)

-- abstract syntax tree 
data Expr = Num Int
    | Add Expr Expr
    | Sub Expr Expr
    | Mul Expr Expr
    | Div Expr Expr
    | Fac Expr
    | Par Expr
    | SquBra Expr
    | CurBra Expr
    deriving (Show)

lexer :: String -> [Token]
lexer [] = []
lexer ('+':str) = TAdd : lexer str
lexer ('-':str) = TSub : lexer str
lexer ('*':str) = TMul : lexer str
lexer ('/':str) = TDiv : lexer str
lexer ('(':str) = TOPar : lexer str
lexer (')':str) = TCPar : lexer str
lexer (ch:str)
    | isSpace ch = lexer str
    | isDigit ch = lexerNum (ch:str)
    | isAlpha ch = error "Lexical Error!"

lexerNum :: String -> [Token]
lexerNum str = case span isDigit str of
    (num, rest) -> TNum (read num) : lexer rest