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
include examples/CMakeFiles/serial_test.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/serial_test.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/serial_test.dir/flags.make

examples/CMakeFiles/serial_test.dir/serial_test.c.o: examples/CMakeFiles/serial_test.dir/flags.make
examples/CMakeFiles/serial_test.dir/serial_test.c.o: ../examples/serial_test.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object examples/CMakeFiles/serial_test.dir/serial_test.c.o"
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/examples && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/serial_test.dir/serial_test.c.o   -c /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/examples/serial_test.c

examples/CMakeFiles/serial_test.dir/serial_test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/serial_test.dir/serial_test.c.i"
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/examples && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/examples/serial_test.c > CMakeFiles/serial_test.dir/serial_test.c.i

examples/CMakeFiles/serial_test.dir/serial_test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/serial_test.dir/serial_test.c.s"
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/examples && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/examples/serial_test.c -o CMakeFiles/serial_test.dir/serial_test.c.s

examples/CMakeFiles/serial_test.dir/serial_test.c.o.requires:

.PHONY : examples/CMakeFiles/serial_test.dir/serial_test.c.o.requires

examples/CMakeFiles/serial_test.dir/serial_test.c.o.provides: examples/CMakeFiles/serial_test.dir/serial_test.c.o.requires
	$(MAKE) -f examples/CMakeFiles/serial_test.dir/build.make examples/CMakeFiles/serial_test.dir/serial_test.c.o.provides.build
.PHONY : examples/CMakeFiles/serial_test.dir/serial_test.c.o.provides

examples/CMakeFiles/serial_test.dir/serial_test.c.o.provides.build: examples/CMakeFiles/serial_test.dir/serial_test.c.o


# Object files for target serial_test
serial_test_OBJECTS = \
"CMakeFiles/serial_test.dir/serial_test.c.o"

# External object files for target serial_test
serial_test_EXTERNAL_OBJECTS =

examples/serial_test: examples/CMakeFiles/serial_test.dir/serial_test.c.o
examples/serial_test: examples/CMakeFiles/serial_test.dir/build.make
examples/serial_test: src/libftdi1.so.2.4.0
examples/serial_test: /usr/lib/x86_64-linux-gnu/libusb-1.0.so
examples/serial_test: examples/CMakeFiles/serial_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable serial_test"
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/serial_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/serial_test.dir/build: examples/serial_test

.PHONY : examples/CMakeFiles/serial_test.dir/build

examples/CMakeFiles/serial_test.dir/requires: examples/CMakeFiles/serial_test.dir/serial_test.c.o.requires

.PHONY : examples/CMakeFiles/serial_test.dir/requires

examples/CMakeFiles/serial_test.dir/clean:
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/examples && $(CMAKE_COMMAND) -P CMakeFiles/serial_test.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/serial_test.dir/clean

examples/CMakeFiles/serial_test.dir/depend:
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/examples /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/examples /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/examples/CMakeFiles/serial_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/serial_test.dir/depend

