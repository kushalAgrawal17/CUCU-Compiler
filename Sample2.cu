int k;
int func(int len);
int func2(int len) {
    return 0;
}
int main() {
    int i = 2 + 3;
    i = 3 - 5 + i //semicolon is missing
    int a = 0;
    func2(i);
    if(0<<8) { //no "<<" operator is defined
        i = 5;
    }
    else {
       i = 9;
    }
       //this is comment
    return i +2;
}

