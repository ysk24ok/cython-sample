#include "myclass.hpp"

namespace mylib {

MyClass::MyClass() : i_(0) {}

MyClass::MyClass(int i) : i_(i) {}

void MyClass::FromMyStruct(const MyStruct& my_struct) {
  i_ = my_struct.i;
}

int MyClass::GetI() const {
  return i_;
}


}  // namespace mylib
