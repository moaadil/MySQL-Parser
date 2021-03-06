%{
#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include "sql.tab.h"
#include "sql.h"
%}

%%
select |
SELECT				{ return SELECT; }
drop |
DROP					{ return DROP; }
table |
TABLE					{ return TABLE; }
tables |
TABLES					{ return TABLES; }
database |
DATABASE				{ return DATABASE; }
databases |
DATABASES				{ return DATABASES; }
create |
CREATE				{ return CREATE; }
insert |
INSERT				{ return INSERT; } 
update |
UPDATE				{ return UPDATE; } 
set |
SET 					{ return SET; } 
delete |
DELETE 				{ return DELETE; } 
from |
FROM					{ return FROM; } 
where |
WHERE					{ return WHERE; } 
into |
INTO 					{ return INTO; } 
values |
VALUES					{ return VALUES; } 
and |
AND						{ return AND; } 
or |
OR						{ return OR; } 
int |
INT   					{ return INT; } 
char |
CHAR 					{ return CHAR; }  
show |
SHOW					{ return SHOW; } 
exit |
EXIT					{ return EXIT; } 
use |
USE						{ return USE; } 
[;]		|				
[(]		|				
[)]		|				
[*]		|				
[,]		|				
"<="	|
">="	|
[!]		|
"<"		|
">"		|
[=]						{strcpy(err,yytext);return *yytext;}
[\'][A-Za-z][A-Za-z0-9_]*[\'] 		{ strcpy(err,yytext);yylval.strval=strdup(yytext); return STRING; }
[A-Za-z][A-Za-z0-9_]*	{strcpy(err,yytext); yylval.strval=strdup(yytext); return ID; }
[0-9]+ 		{ strcpy(err,yytext);yylval.intval=atoi(yytext); return NUMBER;	}			
\n						{strcpy(err,yytext);return *yytext;}
[ \t]+					/* ignore whitespace */
%%