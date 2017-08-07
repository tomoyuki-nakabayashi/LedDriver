#!/bin/bash

mkdir extsrc
mkdir results
git clone https://github.com/google/googletest extsrc/googletest
cd make && make && make test
cd ../bin && ./LedDriver --gtest_output=xml:../results/test_result.xml
pwd
cd ../make/obj
lcov -c -d . -o coverage.info
genhtml -o ../../results/ coverage.info

