#include "Arguments.h"
#include <iostream>

namespace ghostcom::core {

Arguments::Arguments(int argc, char* argv[]) : argc(argc), argv(argv) {
    for (int i = 0; i < argc; ++i) {
        raw_args.emplace_back(argv[i]);
    }
    parse();
}

void Arguments::parse() {
    for (size_t i = 1; i < raw_args.size(); ++i) {
        const std::string& token = raw_args[i];
        if (token.starts_with("--") || (token.starts_with("-") && token.size() == 2)) {
            if (i + 1 < raw_args.size() && !raw_args[i + 1].starts_with("-")) {
                options[token] = raw_args[i + 1];
                ++i;
            } else {
                options[token] = "true"; // flag switch
            }
        }
    }
}

bool Arguments::has(const std::string& flag) const {
    return options.find(flag) != options.end();
}

std::string Arguments::get(const std::string& key, const std::string& defaultValue) const {
    auto it = options.find(key);
    if (it != options.end()) return it->second;
    return defaultValue;
}

void Arguments::add_option(const std::string& key, const std::string& description) {
    descriptions[key] = description;
}

void Arguments::add_flag(const std::string& key, const std::string& description) {
    descriptions[key] = description + " (flag)";
}

void Arguments::print_help(const std::string& programName) const {
    std::cout << "Usage: " << programName << " [options]\nOptions:\n";
    for (const auto& [key, desc] : descriptions) {
        std::cout << "  " << key << "\t" << desc << "\n";
    }
}

} // namespace ghostcom::core
