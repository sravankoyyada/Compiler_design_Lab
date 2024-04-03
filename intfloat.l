%{
	#include<stdio.h>
	int intnumcount=0,floatnumcount=0;
%}

%%
[0-9]+"."[0-9]+ {ECHO;printf("float number\n");floatnumcount++;}
[0-9]+ {ECHO;printf("integer number\n");intnumcount++;}
%%
int yywrap(){return 1;}
int main()
{
	printf("enter values as array ex:2 3.1 5.0 6");
	yylex();
	printf("inter count=%d\nfloat numbers count=%d",intnumcount,floatnumcount);

	return 0;
}