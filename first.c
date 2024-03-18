#include<stdio.h>
#include<ctype.h>
void FIRST(char[],char);
void addToResultSet(char[],char);
int n;
char productionSet[10][10];
int main() {
	int i;
	char choice;
	char c;
	char Result[20];
	printf("enter no of productions:");
	scanf("%d",&n);
	for(int i=0;i<n;i++) {
		scanf("%s",productionSet[i]);
	}
	do
	{
		printf("find the first of :\n");
		scanf(" %c",&c);
		FIRST(Result,c);
		printf("\n first(%c)={",c);
		for(int i=0;Result[i]!='\0';i++)
		printf(" %c\n",Result[i]);
		printf("press y to continue");
		scanf(" %c",&choice);
	}
	while(choice=='y'||choice=='Y');
}
void FIRST(char* Result,char c) {
	int i,j,k;
	char subResult[20];
	int foundEpsilon;
	subResult[0]='\0';
	Result[0]='\0';
	if(!(isupper(c))){
		addToResultSet(Result,c);
		return;
	}
	for(int i=0;i<n;i++) {
		if(productionSet[i][0]==c) {
			if(productionSet[i][2]=='$') {
				addToResultSet(Result,'$');
			}
			else {
				j=2;
				while(productionSet[i][j]!='\0') {
					foundEpsilon=0;
					FIRST(subResult,productionSet[i][j]);
					for(k=0;subResult[k]!='\0';k++)
						addToResultSet(Result,subResult[k]);
					for(k=0;subResult[k]!='\0';k++) 
						if(subResult[k]=='$') {
							foundEpsilon=1;
							break;
						}
						if(!foundEpsilon)
							break;
						j++;
				}
			}
		}
	}
			return;
}
void addToResultSet(char Result[],char val) {
	int k;
	for(k=0;Result[k]!='\0';k++) 
		if(Result[k]==val)
			return;
	Result[k]=val;
	Result[k+1]='\0';
}	
