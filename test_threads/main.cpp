//
//  main.cpp
//  test_threads
//
//  Created by Ruiqing Wang on 8/22/24.
//

#include <iostream>
#include <omp.h> // need this to call functions, omp_get_....

int main (int argc, char *argv[]) {
  int id;
  std::cout << "C++ Start" << std::endl;
#pragma omp parallel private(id)
  {  // Parallel Section begins
    id = omp_get_thread_num();
#pragma omp critical
    std::cout <<  "hello from " << id << std::endl;
#pragma omp barrier
    if ( id == 0 ) {
      int nthreads = omp_get_num_threads();
      std::cout << nthreads << " threads said hello!" << std::endl;
    }
  }  // Parallel Section ends
  std::cout << "End" << std::endl;

  return 0;
}
