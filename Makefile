# GhostCom - Minimal Makefile Scaffold

.PHONY: all linux win mac clean

CXX := g++
CXXFLAGS := -std=c++20 -Wall -Iinclude -static -static-libgcc -static-libstdc++ -static-libstdc++
SRC_DIR := src
OUT_WINDOWS := bin/ghostcom.exe
INCLUDES_DIR := $(SRC_DIR)/includes
GHOSTCOM_UTILS_DIR := $(SRC_DIR)/ghostcom/util
GHOSTCOM_UTILS := $(GHOSTCOM_UTILS_DIR)/Logger.cpp
GHOSTCOM_CORE_DIR := $(SRC_DIR)/ghostcom/core
GHOSTCOM_CORE := $(GHOSTCOM_CORE_DIR)/Arguments.cpp $(GHOSTCOM_CORE_DIR)/Application.cpp
GHOSTCOM_APPLICATION = $(SRC_DIR)/main.cpp $(GHOSTCOM_UTILS) $(GHOSTCOM_CORE) 

all: win
	echo "Please specify a target: make linux, make win, or make mac"

linux:
	echo "[Linux] Compiling GhostCom using gcc with static linking..."
	# gcc -static -Os -Wall src/main.c -o bin/ghostcom-linux -lssl -lcrypto

mac:
	echo "[macOS] Compiling GhostCom using clang..."
	# clang -Os -Wall src/main.c -o bin/ghostcom-mac -framework Security -framework CoreFoundation

clean:
	echo "Cleaning build directory..."
	# rm -f bin/*

win: $(OUT_WINDOWS)
	echo "[Windows] Compiling GhostCom using x86_64-w64-mingw32-gcc with static linking..."

$(OUT_WINDOWS) : $(GHOSTCOM_APPLICATION)
	@mkdir -p bin
	$(CXX) $(CXXFLAGS) -o $@ $^

run: $(OUT_WINDOWS)
	./$(OUT_WINDOWS) --server 127.0.0.1 --port 8080 --message "Hello from GhosCom"

