# CUCU-Compiler
Desinging a compiler using Lex and Yacc.

The following files are present:
1. cucu.l
2. cucu.y
3. README.md
4. Sample1.cu 
5. Sample2.cu

How to run the programm:
On the command line in linux,run the program by entering the following commands:
1. bison -d cucu.y
2. flex cucu.l
3. gcc cucu.tab.c lex.yy.c -lfl -o cucu
4. ./cucu Sample.cu

A file Lexer.txt is generated having all tokens, and a file Parser.txt is generated were syntactical errors are displayed if any.

Sample1.cu and Sample2.cu files have sample CUCU code with correct syntax and incorrect syntax respectively to demonstrate that the compiler works on the specified language and can recognize errors.

If there is an error then the parser and lexer will stop printing the tokens in the files and the program will end. 
The program will print if the code in Sample.cu is valid or invalid.

rules--
CUCU source files contains a program
A program is a list of variable declarations, function declarations and function definitions
The supported data types are only int and char *
Identifier is a sequence of letters, digits and an underscore symbol starting with a letter!
valid statements of our CUCU language:
1. assignment statements
2. declaration statements
3. if-else statements
4. while statements
5. function call
6. return statements
arithematic operators that are allowed are: +,-,/,*

ASSUMPTIONS:
1. Comments are ignored. Comments can be of the following form:   
        1. "//comment" - for single line comments
        2. "/*comments*/" - for comments containing one or more than one line
2. for if and while statements the boolean expression inside parenthesis can take either "expr" or "expr bool_op expr" where bool_op can be one of {<,>,=,==,!=,<=,>=}.
3. In if, else statements and while loop, curly brackets are necessary and the statements to be executed if condition is true should be written inside them.
4. No other data types or special operators are considered that are not mentioned in the readme file.
