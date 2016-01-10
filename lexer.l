%{
#include <iostream>
#include <map>
#include <string>
#include <vector>
using namespace std;
map<string, map<string, int> > lexeme_token_count;
int yylval;
string str;
%}

%%
[ \t]+
[\n] {lexeme_token_count["NEWLINE"]["NEWLINE"]++;}
"+" {lexeme_token_count["+"]["OP_PLUS"]++;} 
"-" {lexeme_token_count["-"]["OP_MINUS"]++;}
"*" {lexeme_token_count["*"]["OP_MULT"]++;}
"/" {lexeme_token_count["/"]["OP_DIV"]++;}
"=" {lexeme_token_count["="]["OP_EQUAL"]++;}
"{" {lexeme_token_count["{"]["OP_LEFTBRACE"]++;}
"abstract"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"assert"	{lexeme_token_count["assert"]["KEYWORD_ASSERT"]++;}
"boolean"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"break"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"byte"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"case"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"catch"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"char"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"class"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"const"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"continue"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"default"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"do"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"double"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"else"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"enum"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"extends"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"final"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"finally"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"float"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"for"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"goto"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"if"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"implements"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"import"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"instanceof"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"int"		{lexeme_token_count["int"]["TYPE"]++;}
"interface"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"long"		{lexeme_token_count["long"]["TYPE"]++;}
"native"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"new"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"package"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"private"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}	
"public"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"return"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"short"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"static"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"strictfp"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"switch"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"synchronized"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"this"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"throw"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"throws"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"transient"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"try"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"void"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"volatile"	{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"while"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"null"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"true"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}
"false"		{lexeme_token_count["abstract"]["KEYWORD_ABSTRACT"]++;}	
[_a-zA-Z][_a-zA-Z0-9]{0,30}	{lexeme_token_count[yytext]["INDENTIFIER"]++;}
[+-]?([0-9]+\.([0-9]+)?|\.[0-9]+)([eE][+-]?[0-9]+)? {lexeme_token_count[yytext]["FLOAT_NUM"]++;  cout << "float is" << yytext<< "count is" << lexeme_token_count[yytext]["FLOAT_NUM"] << endl; }
[0-9]+|[0-9]*	{lexeme_token_count[yytext]["INT_NUM"]++;   cout << "int is" << yytext<< "count is" << lexeme_token_count[yytext]["INT_NUM"] << endl; }

%%


main(int argc, char **argv)
{
	yylex();
}
