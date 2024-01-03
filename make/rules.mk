CXX = g++
CXXFLAGS = -std=c++17 -pedantic
CXXFLAGS += -Wall -Wextra
CXXFLAGS += -g

# src: https://carlpearson.net/post/20220301-gcc-flags/
CXXFLAGS += -Wcast-align # warn whenever a pointer is cast such that the required alignment is increased (char* -> int*).
CXXFLAGS += -Wcast-qual # warn when qualifier (const) is cast away, or introduces a qualifier in an unsafe way.
CXXFLAGS += -Wdisabled-optimization # warn if a requested optimization pass is disabled (e.g. code is too large, has some other feature that makes g++ give up).
CXXFLAGS += -Wduplicated-branches # warn if if-else branches have identical bodies.
CXXFLAGS += -Wduplicated-cond # warn about duplicated conditions in an if-else-if chain.
CXXFLAGS += -Wformat=2 # same as -Wformat -Wformat-nonliteral -Wformat-security -Wformat-y2k. make sure printf-style function arguments match their format strings.
CXXFLAGS += -Wlogical-op # warn about suspicious use of logical operators, i.e. contexts where bitwise is more likely.
CXXFLAGS += -Wmissing-include-dirs # warn if a user-supplied include dir does not exist.
CXXFLAGS += -Wnull-dereference # warn if paths that dereference a null pointer are detected.
CXXFLAGS += -Woverloaded-virtual # warn when a function declaration hides virtual functions from a base class
CXXFLAGS += -Wpointer-arith # warn about sizeof for function types or void.
CXXFLAGS += -Wshadow # warn about variable shadowing and global function shadowing.
CXXFLAGS += -Wswitch-enum # warn when a switch on an enum type is missing one of the enums.
CXXFLAGS += -Wvla # warn about using variable-length arrays.
