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
include examples/CMakeFiles/eeprom.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/eeprom.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/eeprom.dir/flags.make

examples/CMakeFiles/eeprom.dir/eeprom.c.o: examples/CMakeFiles/eeprom.dir/flags.make
examples/CMakeFiles/eeprom.dir/eeprom.c.o: ../examples/eeprom.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object examples/CMakeFiles/eeprom.dir/eeprom.c.o"
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/examples && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/eeprom.dir/eeprom.c.o   -c /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/examples/eeprom.c

examples/CMakeFiles/eeprom.dir/eeprom.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/eeprom.dir/eeprom.c.i"
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/examples && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/examples/eeprom.c > CMakeFiles/eeprom.dir/eeprom.c.i

examples/CMakeFiles/eeprom.dir/eeprom.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/eeprom.dir/eeprom.c.s"
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/examples && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/examples/eeprom.c -o CMakeFiles/eeprom.dir/eeprom.c.s

examples/CMakeFiles/eeprom.dir/eeprom.c.o.requires:

.PHONY : examples/CMakeFiles/eeprom.dir/eeprom.c.o.requires

examples/CMakeFiles/eeprom.dir/eeprom.c.o.provides: examples/CMakeFiles/eeprom.dir/eeprom.c.o.requires
	$(MAKE) -f examples/CMakeFiles/eeprom.dir/build.make examples/CMakeFiles/eeprom.dir/eeprom.c.o.provides.build
.PHONY : examples/CMakeFiles/eeprom.dir/eeprom.c.o.provides

examples/CMakeFiles/eeprom.dir/eeprom.c.o.provides.build: examples/CMakeFiles/eeprom.dir/eeprom.c.o


# Object files for target eeprom
eeprom_OBJECTS = \
"CMakeFiles/eeprom.dir/eeprom.c.o"

# External object files for target eeprom
eeprom_EXTERNAL_OBJECTS =

examples/eeprom: examples/CMakeFiles/eeprom.dir/eeprom.c.o
examples/eeprom: examples/CMakeFiles/eeprom.dir/build.make
examples/eeprom: src/libftdi1.so.2.4.0
examples/eeprom: /usr/lib/x86_64-linux-gnu/libusb-1.0.so
examples/eeprom: examples/CMakeFiles/eeprom.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable eeprom"
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/eeprom.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/eeprom.dir/build: examples/eeprom

.PHONY : examples/CMakeFiles/eeprom.dir/build

examples/CMakeFiles/eeprom.dir/requires: examples/CMakeFiles/eeprom.dir/eeprom.c.o.requires

.PHONY : examples/CMakeFiles/eeprom.dir/requires

examples/CMakeFiles/eeprom.dir/clean:
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/examples && $(CMAKE_COMMAND) -P CMakeFiles/eeprom.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/eeprom.dir/clean

examples/CMakeFiles/eeprom.dir/depend:
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/examples /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/examples /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/examples/CMakeFiles/eeprom.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/eeprom.dir/depend

