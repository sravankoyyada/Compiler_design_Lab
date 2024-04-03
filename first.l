% {#include <stdio.h>
%}
%%
"hi"{ printf("By");}
.*{print("wrong");}
%%

int main()
{
printf("Enter input");
yylex();
}

int yywrap()
{	
	return 1;
}


