#include "ghostcom/ghostcom.h"
#include <windows.h>
#include <stdio.h>
#include <iostream>
#include <string>

using namespace ghostcom::util;
using namespace ghostcom::core;

int main(int argc, char *argv[]) {
    ghostcom::ghostcom_start(argc, argv);
    return 0;
}

void ghostcom::ghostcom_start(int argc, char *argv[]) {

#ifdef _WIN32
    Logger logger;
    logger.set_log_file("ghostcom.log");
    Application app(argc, argv);
    app.setLogger(&logger);
    app.run();
#elif __APPLE__
    printf("\n[GhostCom] Running on macOS\n");
#elif __linux__
    printf("\n[GhostCom] Running on Linux\n");
#elif __unix__
    printf("\n[GhostCom] Running on Unix\n");
#else
    printf("\n[GhostCom] Unknown platform\n");
#endif
} 
