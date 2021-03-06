#include "my_functions.h"
#include <iostream>

//C++14
auto f() noexcept 
{
  return "Hello world\n";
}

int main()
{
  #ifndef NDEBUG
  #error(one should not profile in debug mode)
  #endif
  
  std::cout << is_odd(42) << '\n';
  std::cout << calc_mean( { 41.0, 42.0, 43.0 } ) << '\n';
}
