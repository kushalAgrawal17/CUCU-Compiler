int k;
int func(int len);
int func2(int len) {
    return 0;
}
int main() {
    int i = 2 + 3;
    i = 3 - 5 + i;
    int a = 0;
    func2(i);
    if(i>0) {
        i = 5;
    }
    else {
       i = 9;
    }
       //this is comment
    return i +2;
}
