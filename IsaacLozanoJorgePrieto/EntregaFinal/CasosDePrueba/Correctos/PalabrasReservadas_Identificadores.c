int main(void)
{
int i;
for(i = 0; i < 5; i = i + 1)
{
	int a;
	a = a + 1;
	if ( a == 4 )
	{
	   a = 3;
	}
	else
	{
	   a = 6;
	}
	if ( a < 4 )
	{
	   a = 3;
	}
	else
	{
	   a = 6;
	}
	if ( a <= 4 )
	{
	   a = 3;
	}
	else
	{
	   a = 6;
	}	
}
int i;
i = 4;

do{
 i = i + 1;
}
until( i == 5 )

while(i == 0)
{
i = i - 1;
}
return 0;
}