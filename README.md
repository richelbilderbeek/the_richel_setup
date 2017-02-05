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

normal|testing
---|---
my_functions.h|my_functions.h
my_functions.cpp|my_functions.h
main.cpp|main_test.cpp
 |my_functions_test.cpp
