#!/bin/bash
BUILD_DIR=./build
TESTS_DIR=./tests
CHECK_CPP=./checker/check.cpp
CHECK_APP="$BUILD_DIR/checker"
SOLVE_CPP=./solutions/solution1.cpp
SOLVE_CPP_APP="$BUILD_DIR/cpp_solution"
SOLVE_CPP_OUT="$BUILD_DIR/cpp.output"
SOLVE_RUBY_APP="ruby ./solutions/solution1.rb"
SOLVE_RUBY_OUT="$BUILD_DIR/ruby.out"

rm -rf $BUILD_DIR && mkdir -p $BUILD_DIR
echo "... make checker" && g++ -w -O2 -o "$CHECK_APP" "$CHECK_CPP"
echo "... make cpp solution" && g++ -x c++ -std=c++0x -O2 -o "$SOLVE_CPP_APP" "$SOLVE_CPP"
echo "... compare solutions"

for i in $(ls -R "$TESTS_DIR" | grep -e '^[0-9]\+$' | sort); do
    TEST="$TESTS_DIR/$i"
    echo -e "\n\n... test $i"

    echo -e "\ncpp (real output):" && time $SOLVE_CPP_APP < "$TEST" > "$SOLVE_CPP_OUT"
    echo -e "\ncpp (fake output):" && time $SOLVE_CPP_APP < "$TEST" > /dev/null
    echo -e "\ncpp correctness:" && "$CHECK_APP" "$TEST" "$SOLVE_CPP_OUT" "$TEST.a"

    echo -e "\nruby (real output):" && time $SOLVE_RUBY_APP < "$TEST" > "$SOLVE_RUBY_OUT"
    echo -e "\nruby (fake output):" && time $SOLVE_RUBY_APP < "$TEST" > /dev/null
    echo -e "\nruby correctness:" && "$CHECK_APP" "$TEST" "$SOLVE_RUBY_OUT" "$TEST.a"
done
