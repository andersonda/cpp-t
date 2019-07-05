#include <iostream>
#include <cstring>

using namespace std;

int main(){
  char first_name[20] {};
  char last_name[20] {};
  char full_name[40] {};

  cout << "First name: ";
  cin >> first_name;
  cout << "The first character of your first name is " << first_name[0] << endl;
  cout << "Last name: ";
  cin >> last_name;
  cout << "The first character of your last name is " << last_name[0] << endl;

  strcpy(full_name, first_name);
  strcat(full_name, " ");
  strcat(full_name, last_name);
  cout << "Your full name is " << full_name << " and is " << strlen(full_name) - 1 << " characters long." << endl;


  return 0;
}
