from distutils.core import setup, Extension
from Cython.Build import cythonize

ext = Extension(
    "mylib",
    sources=[
        'mylib.pyx',
        'csrc/myclass.cpp',
        'csrc/myfunc.cpp',
        'csrc/mystruct.cpp'
    ],
    language="c++",
    include_dirs=["."]
)

setup(
    name="mylib",
    ext_modules=cythonize([
        ext
    ])
)
