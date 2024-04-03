%{
	#include<stdio.h>
	int length;
	void fun(int);
%}

%%
[a-zA-Z0-9]+ {length=yyleng;fun(length);}
%%

void fun(int length)
{
	if(yytext[0]=='A'||yytext[0]=='a')
	{
	if(length==3)
	{
		printf("%s is word with length 3",yytext);

	}
	else{
	printf("%s is not length 3",yytext);
	}
	}
	else{
	printf("%s is not length 3",yytext);
	}
}

int yywrap(){}
int main()
{	yylex();

	return 0;
}