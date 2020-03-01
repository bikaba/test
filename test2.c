extern int ml_func(int,int);
extern void ml_func3(int i, int x);
extern const int myconst;
extern int myglob;

int (*f)(int,int) = ml_func;

void ml_func4(void)
{
    f(myconst, myglob);
}

static const int (*f2)(int,int) = ml_func;

void ml_func5(void)
{
    f2(0xa5, 0xde);
    ml_func3(0xde, 0x55);
}
