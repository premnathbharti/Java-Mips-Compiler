%{
#include <iostream>
#include <map>
using namespace std;
map<string,int> toke_count;
int yylval;
%}

%%
[ \t]+
{EOL}	{toke_count["NEWLINE"]++;cout << "NEWLINE";}
"+" { toke_count["PLUS"]++;cout << "PLUS" << endl; cout << "yytext" << yytext << endl;} 
"-" { toke_count["MINUS"]++ ;cout << "MINUS" << endl;cout << "yytext" << yytext << endl;}
"*" { toke_count["MULTIPLY"]++;cout << "MUL" << endl;}
"/" { toke_count["DIVISION"]++; cout << "DIV" << endl;}
[_a-zA-Z][_a-zA-Z0-9]{0,30}	{toke_count["IDENTIFIER"]++;cout << yytext << endl;}
[0-9]+([eE][-+]?[0-9]+)	{toke_count["FLOAT_NUM"]++; cout << "FLOAT_NUM" <<endl;}
[0-9]+|[0-9]*	{toke_count["INT_NUM"]++; cout << "INT_NUM" << endl;}
%%



main(int argc, char **argv)
{
	yylex();
    cout << "lexeme is" << toke_count["NUM"] << endl;
    cout << "no of newline" << toke_count["NEWLINE"] << endl;
}
