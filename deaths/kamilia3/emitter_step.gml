if (a <= 10)
{
	repeat(5)
	{
		instance_create(x, y, oPlayerBloodTypeB);
	};
	
	a += 1;
};

if (a == 10)
{
	instance_destroy();
};