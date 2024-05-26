#include "factorial.h"
long long fact(int n){
    long long f = 1;
    while(n!=1){
        f*=n--;
    }
    return f;
}