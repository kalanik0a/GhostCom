#ifndef GHOSTCOM_UTIL_LOGGER_H
#define GHOSTCOM_UTIL_LOGGER_H

#include <string>
#include <iostream>
#include <fstream>

namespace ghostcom::util {

enum class LogLevel {
    Info,
    Warning,
    Error,
    Debug
};

class Logger {
public:
    explicit Logger(bool use_stdout = true);

    void set_log_file(const std::string& filename);
    void log(LogLevel level, const std::string& message);

    void info(const std::string& message);
    void warn(const std::string& message);
    void error(const std::string& message);
    void debug(const std::string& message);

private:
    void write(const std::string& prefix, const std::string& message);

    std::ofstream file_stream;
    bool log_to_stdout;

#ifdef _WIN32
    void write_to_windows_debugger(const std::string& message);
#endif
};

} // namespace ghostcom::util

#endif // GHOSTCOM_UTIL_LOGGER_H
