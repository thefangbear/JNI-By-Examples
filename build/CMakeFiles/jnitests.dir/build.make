# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_SOURCE_DIR = /home/alex/Projects/jnitests

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/alex/Projects/jnitests/build

# Include any dependencies generated for this target.
include CMakeFiles/jnitests.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/jnitests.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/jnitests.dir/flags.make

CMakeFiles/jnitests.dir/Utilities.cpp.o: CMakeFiles/jnitests.dir/flags.make
CMakeFiles/jnitests.dir/Utilities.cpp.o: ../Utilities.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/alex/Projects/jnitests/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/jnitests.dir/Utilities.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/jnitests.dir/Utilities.cpp.o -c /home/alex/Projects/jnitests/Utilities.cpp

CMakeFiles/jnitests.dir/Utilities.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/jnitests.dir/Utilities.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/alex/Projects/jnitests/Utilities.cpp > CMakeFiles/jnitests.dir/Utilities.cpp.i

CMakeFiles/jnitests.dir/Utilities.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/jnitests.dir/Utilities.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/alex/Projects/jnitests/Utilities.cpp -o CMakeFiles/jnitests.dir/Utilities.cpp.s

CMakeFiles/jnitests.dir/Utilities.cpp.o.requires:

.PHONY : CMakeFiles/jnitests.dir/Utilities.cpp.o.requires

CMakeFiles/jnitests.dir/Utilities.cpp.o.provides: CMakeFiles/jnitests.dir/Utilities.cpp.o.requires
	$(MAKE) -f CMakeFiles/jnitests.dir/build.make CMakeFiles/jnitests.dir/Utilities.cpp.o.provides.build
.PHONY : CMakeFiles/jnitests.dir/Utilities.cpp.o.provides

CMakeFiles/jnitests.dir/Utilities.cpp.o.provides.build: CMakeFiles/jnitests.dir/Utilities.cpp.o


# Object files for target jnitests
jnitests_OBJECTS = \
"CMakeFiles/jnitests.dir/Utilities.cpp.o"

# External object files for target jnitests
jnitests_EXTERNAL_OBJECTS =

libjnitests.so: CMakeFiles/jnitests.dir/Utilities.cpp.o
libjnitests.so: CMakeFiles/jnitests.dir/build.make
libjnitests.so: CMakeFiles/jnitests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/alex/Projects/jnitests/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libjnitests.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/jnitests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/jnitests.dir/build: libjnitests.so

.PHONY : CMakeFiles/jnitests.dir/build

CMakeFiles/jnitests.dir/requires: CMakeFiles/jnitests.dir/Utilities.cpp.o.requires

.PHONY : CMakeFiles/jnitests.dir/requires

CMakeFiles/jnitests.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/jnitests.dir/cmake_clean.cmake
.PHONY : CMakeFiles/jnitests.dir/clean

CMakeFiles/jnitests.dir/depend:
	cd /home/alex/Projects/jnitests/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alex/Projects/jnitests /home/alex/Projects/jnitests /home/alex/Projects/jnitests/build /home/alex/Projects/jnitests/build /home/alex/Projects/jnitests/build/CMakeFiles/jnitests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/jnitests.dir/depend

