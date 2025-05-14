#include "../ghostcom.h"
#include <iostream>
#include <cstring>

using ghostcom::core::Arguments;
using ghostcom::util::Logger;
using std::string;
using std::stoi;

namespace ghostcom::core {

Application::Application(int argc, char* argv[]) : argc(argc), argv(argv) {}

void Application::parseArguments() {
    Arguments parser(argc, argv);

    parser.add_flag("-h", "Display help");
    parser.add_flag("--help", "Display help");
    parser.add_flag("--server", "Server IP");
    parser.add_flag("--port", "Server port");
    parser.add_flag("--message", "Message to send");

    if (parser.has("-h") || parser.has("--help")) {
        parser.print_help("GhostCom");
        
    }

    server = parser.get("--server", "127.0.0.1");
    port = stoi(parser.get("--port", "8080"));
    message = parser.get("--message", "");
    this->logger->info("Testing");
}

void Application::setLogger(Logger *instance) {
    this->logger = instance;
}

void Application::showHelp() const {
    std::cout << "Usage: ghostcom --server <ip> --port <port> --message <text>\n";
}

int Application::run() {
    parseArguments();

    // Placeholder for actual network logic
    return 0;
}

} // namespace ghostcom::core
