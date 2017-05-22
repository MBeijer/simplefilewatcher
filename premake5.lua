configuration "windows"
   platforms {"Win32", "x64"}

workspace "SimpleFileWatcherAll"
	configurations { "Debug", "Release" }
	location("build/" .. _ACTION)

	project "SimpleFileWatcher"
		kind "StaticLib"
		language "C++"
		files {"source/*.cpp"}
		includedirs {"include"}
		targetdir "lib/%{cfg.buildcfg}"
	

		configuration "Debug"
			defines { "DEBUG" }
			filter { "platforms:x64" }
				defines { "DEBUG", "SFW_64_BIT" }
			
			symbols "On"
			
		configuration "Release"
			defines { "NDEBUG" }
			filter { "platforms:x64" }
				defines { "NDEBUG", "SFW_64_BIT" }
			optimize "On"
		
	-- A project defines one build target
	project "SimpleDemo"
		targetdir "bin/%{cfg.buildcfg}"
		kind "ConsoleApp"
		language "C++"
		files {
			"SimpleDemo.cpp"
		}
		
		links {"SimpleFileWatcher"}
		includedirs { "include" }
		
		configuration "Debug"
			defines { "DEBUG" }
			filter { "platforms:x64" }
				defines { "DEBUG", "SFW_64_BIT" }
			
			symbols "On"
			
		configuration "Release"
			defines { "NDEBUG" }
			filter { "platforms:x64" }
				defines { "NDEBUG", "SFW_64_BIT" }
			optimize "On"

workspace "SimpleFileWatcherAll"
	startproject("SimpleDemo")