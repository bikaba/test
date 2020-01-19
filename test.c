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

void ml_func3(int i, int x)
{
    aaa[i] = x;
    ml_func2();
}
