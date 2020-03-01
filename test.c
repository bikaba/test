int myglob = 42;
int aaa[32] = {0};
const int myconst = 0xdeadbeaf;

extern int ml_func2(void);

int ml_func(int a, int b)
{
    return myglob + a + b + aaa[0];
}

int ml_func2(void)
{
    return myglob + aaa[0] + myconst;
}

int ml_funcg(void)
{
    extern int gvar1, gvar2;
    extern int lib_func1(int);
    extern int lib_func2(int);
    extern void ml_func5(void);
    lib_func1(gvar1);
    lib_func2(gvar2);
    ml_func5();
}

void ml_func3(int i, int x)
{
    aaa[i] = x;
    ml_func2();
    ml_funcg();
}
