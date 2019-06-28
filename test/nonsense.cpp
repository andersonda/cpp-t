#include <iostream>

using namespace std;

// nonsense file to test AST generation
int main() {
    int i {10};
    cout << i++ - ++i * i-- + --i;
    return 0;
}
