#ifndef GHOSTCOM_CORE_APPLICATION_H
#define GHOSTCOM_CORE_APPLICATION_H

#include <string>
#include <vector>

namespace ghostcom::core {

class Application {
public:
    Application(int argc, char* argv[]);
    int run();
    void setLogger(ghostcom::util::Logger* logger);

private:
    void parseArguments();
    void showHelp() const;

    int argc;
    char** argv;

    std::string server;
    int port = 0;
    std::string message;
    ghostcom::util::Logger* logger = nullptr;
};

} // namespace ghostcom::core

#endif // GHOSTCOM_CORE_APPLICATION_H
