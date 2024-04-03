%{
	int lc=0,sc=0,tc=0,ch=0,c=0,wc=0;
%}
%%
\n {lc++;}
([])+ {sc++;}
\t {tc++;}
. {ch++;c++;}
[a-zA-Z0-9]+ {wc++;c=c+yyleng;}
%%

int yywrap(){}
int main()
{
	printf("enter the intput string");
	yylex();
	printf("the line count=%d\n",lc);
	printf("space count=%d\n",sc);
	printf("tab count=%d\n",tc);
	printf("char count=%d\n",c);
	printf("word count=%d\n",ch+wc);

	return 0;
}