Run this calculator on a file (with a one line expression):

```sh
runghc Main.hs < file.in
```

Or iteratively:

```sh
ghc Maini.hs && ./Maini
```

# Calculator 

| Operation | TokenID | Example | Output |
|:---|:---:|:---|---:|
| Adition | **+** | 2 + 3 | 5 |
| Subtraction | **-** | 2 - 3 | -1 |
| Multiplication | **\*** | 2 * 3 | 6 |
| Division | **/** | 2 / 3 | 0 |
| Parentheses | **(** *Op* **)** | (2+2)*2 | 8 |

# Tools 

- **Compiler**: [Ghc](https://www.haskell.org/ghc/)
- **Parsing**: [Happy](https://haskell-happy.readthedocs.io/en/latest/)

# History Log

| Date | Description |
|:---|:---:|
| Feb 14 11:00 PM | Support for basic arithmetic operations: +, -, *, /. Also support for parentheses for minimum precedence. |
| Feb 15 11:00 AM | Run iteratively support. Minor comment. Alpha- lexical error. |