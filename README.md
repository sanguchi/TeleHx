# TeleHx Haxe project

This is an example Haxe project scaffolded by Visual Studio Code.

Without further changes the structure is following:

 * `src/telehx`: The actual library, the source code you should be interested
 * `src/Main.hx`: Hello World thingy to test the library
 * `build.hxml`: Haxe command line file used to build the project
 * `README.md`: This file


Current targets:  
`neko, node, php, cpp, java, hl`


_Built with Haxe 3.4.4_


Haxelib libraries used:
- hxcpp
- hxjava
- hxnodejs
- hxssl ??? can't remember if the compiler complained about this.


### NOTE  
Hashlink target requires you to build the hl version 1.1.0

**utils**  
This folders contains some python code that generates the Haxe source code for all methods and types found  
on https://core.telegram.org/bots/api, using jinja2 to handle the templates.  
`i'm currently dropping the python scripts to use pure haxe templates`


**.vscode**  

`tasks.json`  
 - _build haxe_  
 > Tries to build the source code for all targets.  
 - _neko_, _node_, _php_, _cpp_, _java_, _hl_  
 > Tasks that runs the target's executable file/main class inside the generated output folder.  
 - _test_  
 > This task compiles and runs the neko target.  

`settings.json`  
 - I don't know why i let this file exist, it's useless, nothing interesting.  
