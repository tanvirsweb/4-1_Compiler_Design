#include<stdio.h>
#include "factorial.h"
#define ll long long
int main(){
    int n;
    scanf("%d", &n);
    ll f = fact(n);
    printf("%d! = %lld\n", n, f);
}