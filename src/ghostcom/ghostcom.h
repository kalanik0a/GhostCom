// src/ghostcom.h
#ifndef GHOSTCOM_H
#define GHOSTCOM_H

#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#ifdef _WIN32
#include <windows.h>
#endif

#include "util/Logger.h"
#include "core/Application.h"
#include "core/Arguments.h"

#ifndef GHOSTCOM_GLOBAL_H
#define GHOSTCOM_GLOBAL_H

// Top-level ghostcom namespace
namespace ghostcom {
    void start_chat(const char* target, const char* message);
    void print_help();

    // Entry point for platform-specific startup
    void ghostcom_start(int argc, char* argv[]);

    namespace core {
        class Application;
        class Config;
    }

    namespace net {
        class Client;
        class Server;
    }

    namespace crypto {
        class GPG;
        class SSL;
        class SSH;
    }

    namespace platform {
        namespace windows {
            class WindowsSocket;
        }
        namespace posix {
            class PosixSocket;
        }
    }

    namespace util {
        class Logger;
        class StringUtils;
        class ArgParser;
    }
}

#endif // GHOSTCOM_GLOBAL_H


#define MAX_MESSAGE_LEN 1024



#endif // GHOSTCOM_H