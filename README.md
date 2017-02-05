# the_richel_setup

[![Travis CI logo](TravisCI.png)](https://travis-ci.org)
![Whitespace](Whitespace.png)
[![Codecov logo](Codecov.png)](https://www.codecov.io)

[![Build Status](https://travis-ci.org/richelbilderbeek/the_richel_setup.svg?branch=master)](https://travis-ci.org/richelbilderbeek/the_richel_setup)
[![codecov.io](https://codecov.io/github/richelbilderbeek/the_richel_setup/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/the_richel_setup?branch=master)

`the_richel_setup` shows Richel Bilderbeek's favorite C++ setup.

## Goals

`the_richel_setup` has:

 * clean seperation of test and normal execution
 * test build has a high amount of runtime testing
 * the normal build can be used for profiling
 * code coverage is measured
 * style is checked by OCLint

## History

`the_richel_setup` is an extension of [part of the Travis C++ tutorial](https://github.com/richelbilderbeek/travis_qmake_gcc_cpp14_boost_test_gcov_oclint).

## Bird's eye view

The files are distributed over two projects as such:

normal|testing
---|---
the_richel_setup.pro|the_richel_setup_test.pro
main.cpp|main_test.cpp
 |my_functions_test.cpp
my_functions.h|my_functions.h
my_functions.cpp|my_functions.h

The goal of this setup is to test and profile the functions in the `my_functions` unit (that is: `my_functions.h` and `my_functions.cpp`).

The normal setup has one project file, `the_richel_setup.pro`. The `main` function of this project is in the file `main.cpp` (I prefer being unoriginal with naming).
The functions to be *used* are in the `my_functions` unit. Even though the tests may fail, one can still use the functions. And it is this `main` function that is
being profiled by `gprof`.

The testing setup has one project file, `the_richel_setup_test.pro`. The `main` function of this project is in the file `main_test.cpp`.
The functions to be *tested* are in the `my_functions` unit. The tests for the functions are in `my_functions_test.cpp`. 
Boost.Test is used as a testing harness. If a test fails, other tests are still performed, even if `std::abort` is called! 

## The normal run

The normal run *uses* the functions in the `my_functions` unit.
Because the tests are absent in this project, it can still be run when tests fail.
The normal run is suited for profiling. Do not forget: profiling must be run in release mode.

### `main.cpp`

The `main` function just demonstrates some use of the functions in the `my_function` unit:

```
#include "my_functions.h"
#include <iostream>

int main()
{
  #ifndef NDEBUG
  #error(one should not profile on debug mode)
  #endif

  std::cout << is_odd(42) << '\n';
  std::cout << calc_mean( { 41.0, 42.0, 43.0 } ) << '\n';
}
```

This run is suited for profiling. Profiling must be run in release mode, otherwise its results
will be misleading. To be strict, running this project in debug mode is disallowed.

### `the_richel_setup.pro`

The `the_richel_setup.pro` files defines which files belong to
the normal run project and how this should be compiled.

```
# Files
SOURCES += main.cpp my_functions.cpp
HEADERS += my_functions.h

# C++14
CONFIG += c++14
QMAKE_CXX = g++-5
QMAKE_LINK = g++-5
QMAKE_CC = gcc-5
QMAKE_CXXFLAGS += -std=c++14

# High warnings levels
QMAKE_CXXFLAGS += -Wall -Wextra -Wshadow -Wnon-virtual-dtor -pedantic -Weffc++ -Werror

# Allow debug and release mode
CONFIG += debug_and_release

# In release mode, turn on profiling
CONFIG(release, debug|release) {

  DEFINES += NDEBUG

  # gprof
  QMAKE_CXXFLAGS += -pg
  QMAKE_LFLAGS += -pg
}
```

This project consists out of three files: `main.cpp` and the `my_functions` unit. 
Tests are absent in this build entirely. 

C++14 is set to be the C++ standard used. The `QMAKE_[something] = [something]-5` are cumbersome, as one would prefer using just the defaults.
This will hinder, for example, crosscompiling by MXE. On the other hand, this setup works on all computers *I* work with, including Travis CI.
If the `-5`s need to be removed to compile, I suggest to just do it. Or create a modified copy.

The warning levels are set to as high as possible: all GCC compiler warnings are enabled. And a warning cannot be ignored,
as `-Werror` escalates a warning as an error.

Then debug and release modes are both enabled. This may be unexpected: the `main` function will not compile in debug mode.

I chose to do so, as I prefer to have broad `.pro` files, that I can copy-paste to other projects.



