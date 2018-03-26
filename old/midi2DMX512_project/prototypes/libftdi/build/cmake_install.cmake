# Install script for directory: /home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES
    "/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/libftdi1.pc"
    "/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/libftdipp1.pc"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM FILES "/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/libftdi1-config")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/libftdi1" TYPE FILE FILES
    "/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/LibFTDI1Config.cmake"
    "/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/LibFTDI1ConfigVersion.cmake"
    "/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/cmake/UseLibFTDI1.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/src/cmake_install.cmake")
  include("/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/ftdipp/cmake_install.cmake")
  include("/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/python/cmake_install.cmake")
  include("/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/ftdi_eeprom/cmake_install.cmake")
  include("/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/examples/cmake_install.cmake")
  include("/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/packages/cmake_install.cmake")
  include("/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/test/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/jj/Dropbox/sound_programming/midi2DMX512_project/prototypes/libftdi/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
