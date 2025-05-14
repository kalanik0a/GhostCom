#include "Logger.h"

#ifdef _WIN32
#include <windows.h>
#endif

namespace ghostcom::util {

Logger::Logger(bool use_stdout) : log_to_stdout(use_stdout) {}

void Logger::set_log_file(const std::string& filename) {
    file_stream.open(filename, std::ios::out | std::ios::app);
}

void Logger::log(LogLevel level, const std::string& message) {
    switch (level) {
        case LogLevel::Info: info(message); break;
        case LogLevel::Warning: warn(message); break;
        case LogLevel::Error: error(message); break;
        case LogLevel::Debug: debug(message); break;
    }
}

void Logger::info(const std::string& message) {
    write("[INFO] ", message);
}

void Logger::warn(const std::string& message) {
    write("[WARN] ", message);
}

void Logger::error(const std::string& message) {
    write("[ERROR]", message);
}

void Logger::debug(const std::string& message) {
    write("[DEBUG]", message);
}

void Logger::write(const std::string& prefix, const std::string& message) {
    std::string output = prefix + " " + message + "\n";

    if (log_to_stdout) {
        std::cout << output;
    }

    if (file_stream.is_open()) {
        file_stream << output;
        file_stream.flush();
    }

#ifdef _WIN32
    write_to_windows_debugger(output);
#endif
}

#ifdef _WIN32
void Logger::write_to_windows_debugger(const std::string& message) {
    OutputDebugStringA(message.c_str());
}
#endif

} // namespace ghostcom::util
