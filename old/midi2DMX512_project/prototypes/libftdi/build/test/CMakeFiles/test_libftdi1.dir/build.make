# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.7

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build

# Include any dependencies generated for this target.
include test/CMakeFiles/test_libftdi1.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/test_libftdi1.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/test_libftdi1.dir/flags.make

test/CMakeFiles/test_libftdi1.dir/basic.cpp.o: test/CMakeFiles/test_libftdi1.dir/flags.make
test/CMakeFiles/test_libftdi1.dir/basic.cpp.o: ../test/basic.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/test_libftdi1.dir/basic.cpp.o"
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/test && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_libftdi1.dir/basic.cpp.o -c /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/test/basic.cpp

test/CMakeFiles/test_libftdi1.dir/basic.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_libftdi1.dir/basic.cpp.i"
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/test/basic.cpp > CMakeFiles/test_libftdi1.dir/basic.cpp.i

test/CMakeFiles/test_libftdi1.dir/basic.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_libftdi1.dir/basic.cpp.s"
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/test/basic.cpp -o CMakeFiles/test_libftdi1.dir/basic.cpp.s

test/CMakeFiles/test_libftdi1.dir/basic.cpp.o.requires:

.PHONY : test/CMakeFiles/test_libftdi1.dir/basic.cpp.o.requires

test/CMakeFiles/test_libftdi1.dir/basic.cpp.o.provides: test/CMakeFiles/test_libftdi1.dir/basic.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/test_libftdi1.dir/build.make test/CMakeFiles/test_libftdi1.dir/basic.cpp.o.provides.build
.PHONY : test/CMakeFiles/test_libftdi1.dir/basic.cpp.o.provides

test/CMakeFiles/test_libftdi1.dir/basic.cpp.o.provides.build: test/CMakeFiles/test_libftdi1.dir/basic.cpp.o


test/CMakeFiles/test_libftdi1.dir/baudrate.cpp.o: test/CMakeFiles/test_libftdi1.dir/flags.make
test/CMakeFiles/test_libftdi1.dir/baudrate.cpp.o: ../test/baudrate.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object test/CMakeFiles/test_libftdi1.dir/baudrate.cpp.o"
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/test && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_libftdi1.dir/baudrate.cpp.o -c /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/test/baudrate.cpp

test/CMakeFiles/test_libftdi1.dir/baudrate.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_libftdi1.dir/baudrate.cpp.i"
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/test/baudrate.cpp > CMakeFiles/test_libftdi1.dir/baudrate.cpp.i

test/CMakeFiles/test_libftdi1.dir/baudrate.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_libftdi1.dir/baudrate.cpp.s"
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/test/baudrate.cpp -o CMakeFiles/test_libftdi1.dir/baudrate.cpp.s

test/CMakeFiles/test_libftdi1.dir/baudrate.cpp.o.requires:

.PHONY : test/CMakeFiles/test_libftdi1.dir/baudrate.cpp.o.requires

test/CMakeFiles/test_libftdi1.dir/baudrate.cpp.o.provides: test/CMakeFiles/test_libftdi1.dir/baudrate.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/test_libftdi1.dir/build.make test/CMakeFiles/test_libftdi1.dir/baudrate.cpp.o.provides.build
.PHONY : test/CMakeFiles/test_libftdi1.dir/baudrate.cpp.o.provides

test/CMakeFiles/test_libftdi1.dir/baudrate.cpp.o.provides.build: test/CMakeFiles/test_libftdi1.dir/baudrate.cpp.o


# Object files for target test_libftdi1
test_libftdi1_OBJECTS = \
"CMakeFiles/test_libftdi1.dir/basic.cpp.o" \
"CMakeFiles/test_libftdi1.dir/baudrate.cpp.o"

# External object files for target test_libftdi1
test_libftdi1_EXTERNAL_OBJECTS =

test/test_libftdi1: test/CMakeFiles/test_libftdi1.dir/basic.cpp.o
test/test_libftdi1: test/CMakeFiles/test_libftdi1.dir/baudrate.cpp.o
test/test_libftdi1: test/CMakeFiles/test_libftdi1.dir/build.make
test/test_libftdi1: src/libftdi1.so.2.4.0
test/test_libftdi1: /usr/lib/x86_64-linux-gnu/libboost_unit_test_framework.so
test/test_libftdi1: /usr/lib/x86_64-linux-gnu/libusb-1.0.so
test/test_libftdi1: test/CMakeFiles/test_libftdi1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable test_libftdi1"
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_libftdi1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/test_libftdi1.dir/build: test/test_libftdi1

.PHONY : test/CMakeFiles/test_libftdi1.dir/build

test/CMakeFiles/test_libftdi1.dir/requires: test/CMakeFiles/test_libftdi1.dir/basic.cpp.o.requires
test/CMakeFiles/test_libftdi1.dir/requires: test/CMakeFiles/test_libftdi1.dir/baudrate.cpp.o.requires

.PHONY : test/CMakeFiles/test_libftdi1.dir/requires

test/CMakeFiles/test_libftdi1.dir/clean:
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/test && $(CMAKE_COMMAND) -P CMakeFiles/test_libftdi1.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/test_libftdi1.dir/clean

test/CMakeFiles/test_libftdi1.dir/depend:
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/test /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/test /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/test/CMakeFiles/test_libftdi1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/test_libftdi1.dir/depend

