add_library(options::fast_math INTERFACE IMPORTED)

if (MSVC)
	set_target_properties(options::fast_math PROPERTIES 
		INTERFACE_COMPILE_OPTIONS /fp:fast
	)
else()
	set_target_properties(options::fast_math PROPERTIES 
		INTERFACE_COMPILE_OPTIONS -ffast-math
	)
	if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
		set_property(TARGET options::fast_math APPEND PROPERTY
			INTERFACE_COMPILE_DEFINITIONS "__extern_always_inline=extern __attribute__((always_inline)) inline"
		)
	endif()
endif()

