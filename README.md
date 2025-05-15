# GhostCom
#### A utility for decentralized on the fly chat

# Building 

## Cross-Platform on Visual Studio Code
- Uses `g++` for compiling and `gdb` for debugging on Linux and Unix
- Uses `x86_64-w64-mingw32-g++.exe` for compiling and `gdb.exe` for debugging on MSYS2 on Windows
- Uses `clang++` for compiling and `lldb` for debugging on macOS
- Uses `make` on all platforms for the build script
- For Windows, you may have to install MSYS2, and use the `setup-windows.sh` or `setup-windows.ps1` script to install the development environment.
- A `Makefile` is used for all builds and cleanup. 
- For all platforms the `Microsoft C/C++ IntelliSense, debugging, and code browsing.` extension is required for usage and debugging

### Building on Visual Studio Code for Windows, macOS, Linux, and Unix
- Go to `Terminal` -> `Run Build Task` or use the hotkey (Windows: CTRL+SHIFT+B)
    - Choose `debug` for a debug build which will autoselect your platform
    - Choose `build` for a regular build which will autoselect your platform

### Debugging on Visual Studio Code for Windows, macOS, Linux, and Unix
- Click the `debug` icon in the left sidebar
- Under `RUN AND DEBUG` pick your instance
    - `(gdb) (Windows) Launch` for Windows default of `gdb`
    - `(gdb) (Linux) Launch` for Linux default of `gdb`
    - `(gdb) (macOS) Launch` for macOS default of `lldb`

### Settings
- All configuration details are within the `.vscode` directory. 
    - `launch.json` contains the debugger configurations
    - `tasks.json` contains the build configurations
    - `settings.json` contains the core workspace configurations
    - `c_cpp_properties.json` contains the properties for the core workspace

# Coding outside the IDE

### The Makefile
- The `Makefile` contains the following targets
```
all
win
win-debug
clean-win
mac
mac-debug
clean-mac
unix
unix-debug
clean-unix
linux
linux-debug
clean-linux
clean-all
```
### The build structure
- The build directories are as such
```
bin/
    win/
        ghostcom.exe
        ghostcom-debug.exe
    linux/
        ghostcom
        ghostcom-debug
    mac/
        ghostcom
        ghostcom-debug
    unix/
        ghostcom
        ghostcom-debug
```

## Dependencies
```
setup-windows.sh     - pacman install script for MSYS2
setup-windows.ps1    - pacman install script for integrated MSYS2 in Powershell
setup-homebrew.sh    - build install for optional GDB, however macOS typically comes with clang and lldb
```