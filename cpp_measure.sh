#!/bin/bash
g++ -x c++ -std=c++0x -O2 -o ./solution1.a solutions/solution1.cpp &&
echo "solution1.cpp (with diff):" &&
time diff <( cat data/output.txt ) <( ./solution1.a < data/input.txt ) &&
echo "solution1.cpp (> dev/null):" &&
time ./solution1.a < data/input.txt > /dev/null