# GhostCom
#### A utility for decentralized on the fly chat

## Windows
### Dependencies
- GhostCom's build environment is built using GCC on Windows using the MingW libraries and using `g++`
- To install the build environment, open `MSYS2 MINGW64`

#### Setting up the build
```
ming64$ ./setup-windows.sh
ming64$ make win 
```

#### Doing a test run
```
ming64$ make run
```
```
C:\path\to\bin> ghostcom.exe --help
```

## Cleaning
```
> make clean
```