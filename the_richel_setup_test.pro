#CONFIG += console debug_and_release
CONFIG += console
CONFIG -= app_bundle
QT -= core gui
TEMPLATE = app
QMAKE_CXXFLAGS += -Wall -Wextra -Weffc++ -Werror

CONFIG(release, debug|release) {
  DEFINES += NDEBUG
}

HEADERS += my_functions.h
SOURCES += my_functions.cpp \
    main_test.cpp \
    my_functions_test.cpp

# C++14
QMAKE_CXX = g++-5
QMAKE_LINK = g++-5
QMAKE_CC = gcc-5
QMAKE_CXXFLAGS += -std=c++14

# Boost.Test
LIBS += -lboost_unit_test_framework

# gcov
QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage
LIBS += -lgcov
