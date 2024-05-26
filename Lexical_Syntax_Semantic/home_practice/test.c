#define n 10
#define fr(i,k) for(i=0;i<k;i++)
#include<stdio.h>
int main()
{
    int a = 0, b = n, c = 0;
    fr(a,b){
        c+=a++;
    }
    printf("%d\n", c);
}