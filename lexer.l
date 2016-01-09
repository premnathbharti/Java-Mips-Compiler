%{
#include <iostream>
#include <map>
using namespace std;
map<string,int> toke_count;
int yylval;
%}

%%
"+" { toke_count["PLUS"]++;cout << "PLUS" << endl; cout << "yytext" << yytext << endl;} 
"-" { toke_count["MINUS"]++ ;cout << "MINUS" << endl;cout << "yytext" << yytext << endl;}
"*" { toke_count["MULTIPLY"]++;cout << "MUL" << endl;}
"/" { toke_count["DIVISION"]++; cout << "DIV" << endl;}
[0-9]+ { toke_count["INT_CONST"]++;yylval = atoi(yytext);  cout << "yyval" << yylval << endl;cout << "INT_CONST" << endl;}
\n  { toke_count["NEWLINE"]++; cout << "NEWLINE";  cout << "yytext" << yytext << endl;}
[ \t] { /* ignore whitespace */ }
.   { printf("Mystery character %c\n", *yytext); }
%%

main(int argc, char **argv)
{
	yylex();
    cout << "lexeme is" << toke_count["NUM"] << endl;
    cout << "no of newline" << toke_count["NEWLINE"] << endl;
}
