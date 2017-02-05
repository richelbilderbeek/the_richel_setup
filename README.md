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
