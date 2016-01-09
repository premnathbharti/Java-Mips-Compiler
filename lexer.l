%{
#include <iostream>
#include <map>
using namespace std;
map<int,int> toke_count;
enum yytokentype {
NUMBER = 258,
ADD = 259,
SUB = 260,
MUL = 261,
DIV = 262,
ABS = 263,
EOL = 264,
};
int yylval;
int tok;
%}

%%
"+" { toke_count[tok]++;cout << yytext;return ADD; } 
"-" { toke_count[tok]++;return SUB; }
"*" { toke_count[tok]++;return MUL; }
"/" { toke_count[tok]++;return DIV; }
"|" { toke_count[tok]++;return ABS; }
[0-9]+ { toke_count[tok]++;yylval = atoi(yytext); return NUMBER; }
\n  { toke_count[tok]++;return EOL; }
[ \t] { /* ignore whitespace */ }
.   { printf("Mystery character %c\n", *yytext); }
%%


main(int argc, char **argv)
{
while(tok = yylex()) 
{
    cout << "token " << tok << "count is" << toke_count[tok] << endl;
}
}
