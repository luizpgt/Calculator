{
    module Parser where
    
    import Lexer
}

%name parser
%tokentype { Token }
%error     { parseError }

%token
    num { TNum $$ }
    '+' { TAdd }
    '-' { TSub }
    '*' { TMul }
    '/' { TDiv }
    '!' { TFac } -- factorial
    '(' { TOPar } -- parentheses
    ')' { TCPar }
    '[' { TOSquBra } -- square brackets 
    ']' { TCSquBra }
    '{' { TOCurBra } -- curly brackets
    '}' { TCCurBra }


%nonassoc '{' '}' '(' ')' '[' ']'

%left '+' '-'
%left '*' '/'
%left '!'

%% 

Exp : num { Num $1 }
    | Exp '+' Exp { Add $1 $3 }
    | Exp '-' Exp { Sub $1 $3 }
    | Exp '*' Exp { Mul $1 $3 }
    | Exp '/' Exp { Div $1 $3 }
    | '(' Exp ')' { Par $2 }

{

parseError :: [Token] -> a
parseError ts = error "Parse Error!"

}