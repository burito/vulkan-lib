vulkan-lib
==========

This is a simple makefile that downloads the Vulkan LunarG SDK's for Windows, MacOS and Linux, extracts the libraries and glslangValidators for each, and creates the appropriate symlink for MacOS and Linux.

I've created this to automate the process of including only the files I need in my projects, and to eliminate possible human error.

* It is currently version 1.1.92.1

Usage
-----

Include this as a submodule in your project.
I recommend pairing this with...
https://github.com/KhronosGroup/Vulkan-Headers

Building
--------
    make clean
    make all

It will only download the SDK's once. ```make clean``` will not delete them. If the SDK's increase in a version, either check back here, or delete the downloaded SDK's manually and try again.

It uses [7zip](https://www.7-zip.org/download.html) to extract from the Windows SDK, ```tar``` for the rest.

Credits
-------

The Makefile and the Readme are my fault, consider them Public Domain, or Apache License Version 2.0
Everything else is thanks to the fantastic work of [LunarG](https://www.lunarg.com/).

The files come from the various SDK's available from the [LunarG Vulkan SDK](https://vulkan.lunarg.com/sdk/home) page. From their website...


License
Copyright (c) 2015-2018 LunarG, Inc.
Copyright (c) 2015-2018 Valve Corporation

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at:

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

Unless otherwise noted in the LICENSE.txt file in the SDK install folder and/or included source code files, all components of the Vulkan SDK are licensed under the above license. Licenses for any components not so licensed are included in the LICENSE.txt file and/or in source code files.