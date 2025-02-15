module Main where

import System.IO (hFlush, stdout)

import Lexer 
import Parser
import Calc

-- "Maini" is supposed to run the calculator iteratively 

main :: IO ()
main = do
    putStrLn "Calculator (':q' quits)"
    loop
  where
    loop = do
        putStr "Expression> "
        hFlush stdout  -- Ensures prompt is shown before user input
        input <- getLine
        if input == ":q"
            then putStrLn "Goodbye!"
            else do
                print . calc . parser . lexer $ input
                loop