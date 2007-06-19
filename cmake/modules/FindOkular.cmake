# - Find Okular
# Find the Okular Generators includes and library
#
# This module defines
#  OKULAR_FOUND
#  OKULAR_LIBRARIES
#  OKULAR_INCLUDE_DIR
#

IF (OKULAR_INCLUDE_DIR AND OKULAR_LIBRARIES)

  # Already in cache
  SET(OKULAR_FOUND TRUE)

ELSE (OKULAR_INCLUDE_DIR AND OKULAR_LIBRARIES)

  FIND_LIBRARY (OKULAR_LIBRARIES okularcore
    PATHS
    /usr/lib
    /usr/local/lib
    ${KDE4_LIB_DIR}
  )

  FIND_PATH (OKULAR_INCLUDE_DIR okular/core/document.h
    /usr/include/
    /usr/local/include/
    ${KDE4_INCLUDE_DIR}
  )

  #
  # everything necessary found?
  #
  IF (OKULAR_LIBRARIES AND OKULAR_INCLUDE_DIR)
    SET (OKULAR_FOUND TRUE)
  ELSE (OKULAR_LIBRARIES AND OKULAR_INCLUDE_DIR)
    SET (OKULAR_FOUND FALSE)
  ENDIF (OKULAR_LIBRARIES AND OKULAR_INCLUDE_DIR)

  MARK_AS_ADVANCED(OKULAR_INCLUDE_DIR OKULAR_LIBRARIES)

ENDIF (OKULAR_INCLUDE_DIR AND OKULAR_LIBRARIES)


#
# output status
#
IF (OKULAR_FOUND)
     if (NOT Okular_FIND_QUIETLY)
        MESSAGE (STATUS "Found Okular Generator: ${OKULAR_INCLUDE_DIR} ${OKULAR_LIBRARIES}")
     endif(NOT Okular_FIND_QUIETLY)
ELSE (OKULAR_FOUND)
     if (Okular_FIND_REQUIRED)
        MESSAGE (FATAL_ERROR "Okular Generator not found." )
     endif (Okular_FIND_REQUIRED)
ENDIF (OKULAR_FOUND)

