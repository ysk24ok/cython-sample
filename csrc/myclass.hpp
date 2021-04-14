#ifndef MYLIB_MYCLASS_HPP_
#define MYLIB_MYCLASS_HPP_

#include "mystruct.hpp"

namespace mylib {

class MyClass {
 public:
  MyClass();
  MyClass(int i);

  void FromMyStruct(const MyStruct& my_struct);

  int GetI() const;

 private:
  int i_;
};

}  // namespace mylib

#endif  // MYLIB_MYCLASS_HPP_
