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
include ftdipp/CMakeFiles/ftdipp1.dir/depend.make

# Include the progress variables for this target.
include ftdipp/CMakeFiles/ftdipp1.dir/progress.make

# Include the compile flags for this target's objects.
include ftdipp/CMakeFiles/ftdipp1.dir/flags.make

ftdipp/CMakeFiles/ftdipp1.dir/ftdi.cpp.o: ftdipp/CMakeFiles/ftdipp1.dir/flags.make
ftdipp/CMakeFiles/ftdipp1.dir/ftdi.cpp.o: ../ftdipp/ftdi.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object ftdipp/CMakeFiles/ftdipp1.dir/ftdi.cpp.o"
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/ftdipp && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ftdipp1.dir/ftdi.cpp.o -c /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/ftdipp/ftdi.cpp

ftdipp/CMakeFiles/ftdipp1.dir/ftdi.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ftdipp1.dir/ftdi.cpp.i"
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/ftdipp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/ftdipp/ftdi.cpp > CMakeFiles/ftdipp1.dir/ftdi.cpp.i

ftdipp/CMakeFiles/ftdipp1.dir/ftdi.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ftdipp1.dir/ftdi.cpp.s"
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/ftdipp && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/ftdipp/ftdi.cpp -o CMakeFiles/ftdipp1.dir/ftdi.cpp.s

ftdipp/CMakeFiles/ftdipp1.dir/ftdi.cpp.o.requires:

.PHONY : ftdipp/CMakeFiles/ftdipp1.dir/ftdi.cpp.o.requires

ftdipp/CMakeFiles/ftdipp1.dir/ftdi.cpp.o.provides: ftdipp/CMakeFiles/ftdipp1.dir/ftdi.cpp.o.requires
	$(MAKE) -f ftdipp/CMakeFiles/ftdipp1.dir/build.make ftdipp/CMakeFiles/ftdipp1.dir/ftdi.cpp.o.provides.build
.PHONY : ftdipp/CMakeFiles/ftdipp1.dir/ftdi.cpp.o.provides

ftdipp/CMakeFiles/ftdipp1.dir/ftdi.cpp.o.provides.build: ftdipp/CMakeFiles/ftdipp1.dir/ftdi.cpp.o


# Object files for target ftdipp1
ftdipp1_OBJECTS = \
"CMakeFiles/ftdipp1.dir/ftdi.cpp.o"

# External object files for target ftdipp1
ftdipp1_EXTERNAL_OBJECTS =

ftdipp/libftdipp1.so.2.4.0: ftdipp/CMakeFiles/ftdipp1.dir/ftdi.cpp.o
ftdipp/libftdipp1.so.2.4.0: ftdipp/CMakeFiles/ftdipp1.dir/build.make
ftdipp/libftdipp1.so.2.4.0: src/libftdi1.so.2.4.0
ftdipp/libftdipp1.so.2.4.0: /usr/lib/x86_64-linux-gnu/libusb-1.0.so
ftdipp/libftdipp1.so.2.4.0: ftdipp/CMakeFiles/ftdipp1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libftdipp1.so"
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/ftdipp && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ftdipp1.dir/link.txt --verbose=$(VERBOSE)
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/ftdipp && $(CMAKE_COMMAND) -E cmake_symlink_library libftdipp1.so.2.4.0 libftdipp1.so.2 libftdipp1.so

ftdipp/libftdipp1.so.2: ftdipp/libftdipp1.so.2.4.0
	@$(CMAKE_COMMAND) -E touch_nocreate ftdipp/libftdipp1.so.2

ftdipp/libftdipp1.so: ftdipp/libftdipp1.so.2.4.0
	@$(CMAKE_COMMAND) -E touch_nocreate ftdipp/libftdipp1.so

# Rule to build all files generated by this target.
ftdipp/CMakeFiles/ftdipp1.dir/build: ftdipp/libftdipp1.so

.PHONY : ftdipp/CMakeFiles/ftdipp1.dir/build

ftdipp/CMakeFiles/ftdipp1.dir/requires: ftdipp/CMakeFiles/ftdipp1.dir/ftdi.cpp.o.requires

.PHONY : ftdipp/CMakeFiles/ftdipp1.dir/requires

ftdipp/CMakeFiles/ftdipp1.dir/clean:
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/ftdipp && $(CMAKE_COMMAND) -P CMakeFiles/ftdipp1.dir/cmake_clean.cmake
.PHONY : ftdipp/CMakeFiles/ftdipp1.dir/clean

ftdipp/CMakeFiles/ftdipp1.dir/depend:
	cd /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/ftdipp /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/ftdipp /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/ftdipp/CMakeFiles/ftdipp1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ftdipp/CMakeFiles/ftdipp1.dir/depend

