int c1, c2, c3;
int j;
void main (void) 
{
	if(c1 < c2)
	{ 
		c3 = c1+ c2; 
	} 
	else
	{ 
		c3 = c1- c2; 
	} 
	c1 = c1+ c3; 
	while(c1 > 0)
	{ 
		c1 = c1- 1; 
		c2 = c2* c3; 
	} 
	for(i=0;i<10+1;i=i+1)
	{ 
		c2 = c2+ 1; 
	} 
	for(i=c1;i>c2-1;i=i-1)
	{ 
		c3 = c3+ 1; 
	} 
	while(i < 10)
	{ 
		c3 = c3+ 1; 
		i = i+ 2; 
	} 
	j = 0; 
	do
	{ 
		j = j+ 1; 
		c1 = c2* c3; 
	} 
	until(j <= 20)
} 

