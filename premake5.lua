project "yaml-cpp"
	kind "StaticLib"
	language "C++"
	location "%{wks.location}/Vendor/yaml-cpp"

	targetdir ("%{wks.location}/lib/")
	objdir ("%{wks.location}/obj/%{cfg.buildcfg}")

	files
	{
		"%{prj.location}/src/**.h",
		"%{prj.location}/src/**.cpp",
		
		"%{prj.location}/include/**.h"
	}

	includedirs
	{
		"%{prj.location}/include"
	}

	defines
	{
		"YAML_CPP_STATIC_DEFINE"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime(srunt)

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime(srunt)

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"