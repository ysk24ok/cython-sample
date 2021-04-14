# distutils: language = c++
# cython: language_level = 3

from cython.operator cimport dereference
from libcpp.string cimport string


cdef extern from "csrc/mystruct.hpp" namespace "mylib":

    cdef cppclass MyStruct:
        MyStruct()
        MyStruct(int)


cdef class MyStructPy(object):

    cdef MyStruct* _thisptr;

    def __cinit__(self, int i):
        self._thisptr = new MyStruct(i)

    def __dealloc__(self):
        del self._thisptr


cdef extern from "csrc/myfunc.hpp" namespace "mylib":

    int increment(int)
    float increment(float)
    string increment(string)


cdef increment_integer(int i):
    return increment(i)


cdef increment_float(float f):
    return increment(f)


cdef increment_string(string s):
    return increment(s)


cdef extern from "csrc/myclass.hpp" namespace "mylib":

    cdef cppclass MyClass:
        MyClass()
        MyClass(int)
        int GetI()
        void FromMyStruct(const MyStruct&)


cdef class MyClassPy(object):

    cdef MyClass* _thisptr;

    def __cinit__(self, int i):
        self._thisptr = new MyClass(i)

    def __dealloc__(self):
        del self._thisptr

    def get_i(self):
        return self._thisptr.GetI()

    def from_my_struct_py(self, MyStructPy my_struct_py):
        self._thisptr.FromMyStruct(dereference(my_struct_py._thisptr))
