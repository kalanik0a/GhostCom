#ifndef GHOSTCOM_CORE_ARGS_H
#define GHOSTCOM_CORE_ARGS_H

#include <unordered_map>
#include <string>
#include <vector>

namespace ghostcom::core {

class Arguments {
public:
    Arguments(int argc, char* argv[]);

    bool has(const std::string& flag) const;
    std::string get(const std::string& key, const std::string& defaultValue = "") const;

    void print_help(const std::string& programName) const;

    void add_option(const std::string& key, const std::string& description);
    void add_flag(const std::string& key, const std::string& description);

private:
    void parse();

    int argc;
    char** argv;

    std::unordered_map<std::string, std::string> options;
    std::unordered_map<std::string, std::string> descriptions;
    std::vector<std::string> raw_args;
};

} // namespace ghostcom::core

#endif // GHOSTCOM_CORE_ARGS_H
