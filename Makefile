# GhostCom - Minimal Makefile Scaffold

.PHONY: all linux win mac clean

CXX := g++
CXX_WIN := x86_64-w64-mingw32-g++.exe
CXX_MAC := clang++
CXXFLAGS_GPP_DEBUG := -g -O0
CXXFLAGS_CLANG_DEBUG := -g -O0
CXXFLAGS_WIN := -std=c++20 -Wall -Wextra -Iinclude -static -static-libgcc -static-libstdc++ -static-libstdc++
CXXFLAGS_UNIX_LINUX := -std=c++20 -Wall -Wextra -Iinclude
CXXFLAGS_MAC := -std=c++20 -Wall -Wextra -Iinclude -framework Security -framework CoreFoundation
SRC_DIR := src
BIN_DIR := bin
OUT_NAME := ghostcom

OUT_WINDOWS := $(BIN_DIR)/win/$(OUT_NAME).exe
OUT_WINDOWS_DEBUG := $(BIN_DIR)/win/$(OUT_NAME)-debug.exe
OUT_LINUX := $(BIN_DIR)/linux/$(OUT_NAME)
OUT_LINUX_DEBUG := $(BIN_DIR)/linux/$(OUT_NAME)-debug
OUT_MAC := $(BIN_DIR)/mac/$(OUT_NAME)
OUT_MAC_DEBUG := $(BIN_DIR)/mach/$(OUT_NAME)-debug
OUT_UNIX := $(BIN_DIR)/unix/$(OUT_NAME)
OUT_UNIX_DEBUG := $(BIN_DIR)/unix/$(OUT_NAME)-debug

INCLUDES_DIR := $(SRC_DIR)/includes
GHOSTCOM_UTILS_DIR := $(SRC_DIR)/ghostcom/util
GHOSTCOM_UTILS := $(GHOSTCOM_UTILS_DIR)/Logger.cpp
GHOSTCOM_CORE_DIR := $(SRC_DIR)/ghostcom/core
GHOSTCOM_CORE := $(GHOSTCOM_CORE_DIR)/Arguments.cpp $(GHOSTCOM_CORE_DIR)/Application.cpp
GHOSTCOM_APPLICATION = $(SRC_DIR)/main.cpp $(GHOSTCOM_UTILS) $(GHOSTCOM_CORE)

all: win mac linux unix
	@echo "Please specify a target: make linux, make win, or make mac"

linux:
	@echo "[Linux] Compiling GhostCom using $(CXX) with static linking..."
	@mkdir -p bin/linux
	$(CXX) $(CXXFLAGS_UNIX_LINUX) $(GHOSTCOM_APPLICATION) -o $(OUT_LINUX)

linux-debug:
	@echo "[Linux] Compiling GhostCom using $(CXX) with static linking..."
	@mkdir -p bin/linux
	$(CXX) $(CXXFLAGS_UNIX_LINUX) $(CXXFLAGS_GPP_DEBUG) $(GHOSTCOM_APPLICATION) -o $(OUT_LINUX_DEBUG)

mac:
	@echo "[macOS] Compiling GhostCom using $(CXX_MAC)..."
	@mkdir -p bin/mac
	$(CXX_MAC) $(CXXFLAGS_MAC) $(GHOSTCOM_APPLICATION) -o $(OUT_MAC)

mac-debug:
	@echo "[macOS] Compiling GhostCom (DEBUG) using $(CXX_MAC)..."
	@mkdir -p bin/mac
	$(CXX_MAC) $(CXXFLAGS_CLANG_DEBUG) $(CXXFLAGS_MAC) $(GHOSTCOM_APPLICATION) -o $(OUT_MAC_DEBUG)

win:
	@echo "[Windows] Compiling GhostCom using $(CXX_WIN) with static linking..."
	@mkdir -p bin/win
	$(CXX_WIN) $(CXXFLAGS_WIN) $(GHOSTCOM_APPLICATION) -o $(OUT_WINDOWS)

win-debug:
	@echo "[Windows] Compiling GhostCom (DEBUG) using $(CXX_WIN) with static linking..."
	@mkdir -p bin/win
	$(CXX_WIN) $(CXXFLAGS_GPP_DEBUG) $(CXXFLAGS_WIN) $(GHOSTCOM_APPLICATION) -o $(OUT_WINDOWS_DEBUG)

unix: 
	@echo "[Unix] Compiling GhostCom using $(CXX) with static linking..."
	@mkdir -p bin/unix
	$(CXX) $(CXXFLAGS_UNIX_LINUX) $(GHOSTCOM_APPLICATION) -o $(OUT_UNIX)

unix-debug:
	@echo "[Unix] Compiling GhostCom (DEBUG) using $(CXX) with static linking..."
	@mkdir -p bin/unix
	$(CXX) $(CXXFLAGS_GPP_DEBUG) $(CXXFLAGS_UNIX_LINUX) $(GHOSTCOM_APPLICATION) -o $(OUT_UNIX_DEBUG)

clean-all: clean-win clean-linux clean-unix clean-mac
	@echo "Cleaning build directory..."

clean-win:
	rm -rf bin/win/*

clean-mac:
	rm -rf bin/mac/*

clean-linux:
	rm -rf bin/linux/*

clean-unix:
	rm -rf bin/unix/*	

run: $(OUT_WINDOWS)
	./$(OUT_WINDOWS) --server 127.0.0.1 --port 8080 --message "Hello from GhosCom"

