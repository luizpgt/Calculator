module Main where

import Lexer 
import Parser

import Calc

main = getContents >>= print . calc . parser . lexer 