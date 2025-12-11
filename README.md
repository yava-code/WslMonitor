# 🖥️ WSL Monitor

[![CI](https://github.com/yava-code/WslMonitor/actions/workflows/ci.yml/badge.svg)](https://github.com/yava-code/WslMonitor/actions/workflows/ci.yml)
[![ShellCheck](https://github.com/yava-code/WslMonitor/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/yava-code/WslMonitor/actions/workflows/shellcheck.yml)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![Bash](https://img.shields.io/badge/bash-%3E%3D4.0-brightgreen.svg)](https://www.gnu.org/software/bash/)

A lightweight, colorful system diagnostic tool for monitoring WSL (Windows Subsystem for Linux) environments. Get instant insights into your WSL system's health with a beautiful command-line interface.

## ✨ Features

- 🎨 **Colorful Output** - Easy-to-read, color-coded system information
- 🔍 **System Detection** - Automatically detects if running in WSL or native Linux
- 💾 **Memory Monitoring** - Real-time RAM usage with percentage calculations
- 💿 **Disk Usage** - Virtual drive usage statistics
- ⚡ **Process Tracking** - Top CPU-consuming processes at a glance
- ⏱️ **Uptime Display** - System uptime information
- 🖥️ **Kernel Info** - Detailed kernel and environment information

## 📸 Screenshot

```
========================================
   WSL SYSTEM DIAGNOSTIC   
========================================

[*] System Info:
    Kernel: 5.15.90.1-microsoft-standard-WSL2
    Environment: WSL (Windows Subsystem for Linux)

[*] Uptime:
    up 2 hours, 15 minutes

[*] Memory Status (Allocated to WSL):
    Used: 2048MB / Total: 8192MB (25%)

[*] Disk Usage (Virtual Drive):
    15% used of 256G

[*] Top Heavy Processes inside WSL:
    PID    COMMAND
    1234   code
    5678   node
    9012   bash

========================================
```

## 🚀 Quick Start

### Prerequisites

- WSL or any Linux distribution
- Bash 4.0 or higher
- Standard Linux utilities: `uname`, `free`, `df`, `ps`, `uptime`

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yava-code/WslMonitor.git
cd WslMonitor
```

2. Make the script executable:
```bash
chmod +x wsl_monitor.sh
```

3. Run the monitor:
```bash
./wsl_monitor.sh
```

### Alternative: Direct Download

```bash
curl -o wsl_monitor.sh https://raw.githubusercontent.com/yava-code/WslMonitor/main/wsl_monitor.sh
chmod +x wsl_monitor.sh
./wsl_monitor.sh
```

## 💡 Usage

Simply execute the script to get a comprehensive overview of your system:

```bash
./wsl_monitor.sh
```

The script will display:
- System kernel and environment type
- Current uptime
- Memory usage (allocated to WSL)
- Disk usage on the virtual drive
- Top resource-consuming processes

## 🛠️ Development

### Running Tests

The project includes a comprehensive test suite using BATS (Bash Automated Testing System):

```bash
# Run all tests
./tests/run_tests.sh

# Run specific test file
bats tests/test_wsl_monitor.bats
```

### Code Quality

We use ShellCheck for static analysis:

```bash
shellcheck wsl_monitor.sh
```

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes
4. Run tests to ensure nothing breaks: `./tests/run_tests.sh`
5. Commit your changes: `git commit -m 'Add amazing feature'`
6. Push to the branch: `git push origin feature/amazing-feature`
7. Open a Pull Request

### Contribution Guidelines

- Follow existing code style
- Add tests for new features
- Update documentation as needed
- Ensure all tests pass before submitting PR
- Keep commits atomic and well-described

## 📋 System Requirements

- **OS**: WSL (any version) or Linux
- **Shell**: Bash 4.0+
- **Dependencies**: 
  - `uname` - system information
  - `free` - memory statistics
  - `df` - disk space usage
  - `ps` - process information
  - `uptime` - system uptime
  - `grep`, `awk` - text processing

## 🔧 Compatibility

- ✅ WSL 1
- ✅ WSL 2
- ✅ Native Linux (Ubuntu, Debian, Fedora, etc.)
- ✅ Works in any terminal emulator

## 📝 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by the need for simple, beautiful system monitoring in WSL environments
- Built with ❤️ for the developer community

## 📞 Support

- 🐛 Found a bug? [Open an issue](https://github.com/yava-code/WslMonitor/issues)
- 💡 Have a feature idea? [Start a discussion](https://github.com/yava-code/WslMonitor/discussions)
- ⭐ Like the project? Give it a star!

---

**Made with ❤️ for WSL users everywhere**