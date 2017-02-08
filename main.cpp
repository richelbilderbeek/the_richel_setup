#include "my_functions.h"
#include <iostream>

int main()
{
  #ifndef NDEBUG
  #error(one should not profile on debug mode)
  #endif
  for (int i=0; i!=1000; ++i)
  {
    std::cout << is_odd(42) << '\n';
    std::cout << calc_mean( { 41.0, 42.0, 43.0 } ) << '\n';
  }
}
