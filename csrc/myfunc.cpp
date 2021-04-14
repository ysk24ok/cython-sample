#include "myfunc.hpp"

namespace mylib {

int increment(int i) {
  return i + 1;
}

float increment(float f) {
  return f + 1.0;
}

std::string increment(const std::string& s) {
  return s + " ";
}

}  // namespace mylib
