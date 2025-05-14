# GhostCom - Minimal Makefile Scaffold

.PHONY: all linux win mac clean

CXX := g++
CXX_WIN := x86_64-w64-mingw32-g++.exe
CXX_MAC := clang++
CXXFLAGS_WIN := -std=c++20 -Wall -Iinclude -static -static-libgcc -static-libstdc++ -static-libstdc++
CXXFLAGS_MAC := -std=c++20 -Wall -Wextra -g -Iinclude
SRC_DIR := src
OUT_WINDOWS := bin/win/ghostcom.exe
OUT_LINUX := bin/linux/ghostcom
OUT_MAC := bin/mac/ghostcom
INCLUDES_DIR := $(SRC_DIR)/includes
GHOSTCOM_UTILS_DIR := $(SRC_DIR)/ghostcom/util
GHOSTCOM_UTILS := $(GHOSTCOM_UTILS_DIR)/Logger.cpp
GHOSTCOM_CORE_DIR := $(SRC_DIR)/ghostcom/core
GHOSTCOM_CORE := $(GHOSTCOM_CORE_DIR)/Arguments.cpp $(GHOSTCOM_CORE_DIR)/Application.cpp
GHOSTCOM_APPLICATION = $(SRC_DIR)/main.cpp $(GHOSTCOM_UTILS) $(GHOSTCOM_CORE)

all: win
	echo "Please specify a target: make linux, make win, or make mac"

$(OUT_LINUX): $(GHOSTCOM_APPLICATION)
	mkdir -p bin
	mkdir -p bin/linux
	$(CXX) $(CXXFLAGS) -o $@ $^

clean-linux:
	rm bin/linux/*

linux: $(OUT_LINUX)
	echo "[Linux] Compiling GhostCom using gcc with static linking..."
	# gcc -static -Os -Wall src/main.c -o bin/ghostcom-linux -lssl -lcrypto

mac:
	@mkdir -p bin bin/mac
	echo "[macOS] Compiling GhostCom using clang..."
	$(CXX_MAC) $(CXXFLAGS_MAC) $(GHOSTCOM_APPLICATION) -o $(OUT_MAC) -framework Security -framework CoreFoundation

clean:
	echo "Cleaning build directory..."
	# rm -f bin/*

clean-win:
	rm bin/win/*

win: $(OUT_WINDOWS)
	echo "[Windows] Compiling GhostCom using x86_64-w64-mingw32-gcc with static linking..."

$(OUT_WINDOWS) : $(GHOSTCOM_APPLICATION)
	@mkdir -p bin
	@mkdir -p bin/win
	$(CXX_WIN) $(CXXFLAGS) -o $@ $^

run: $(OUT_WINDOWS)
	./$(OUT_WINDOWS) --server 127.0.0.1 --port 8080 --message "Hello from GhosCom"

