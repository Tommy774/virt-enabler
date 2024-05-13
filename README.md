# Virt-Enabler

## Introduction
Virt-Enabler is a simple script for enabling nested virtualization in VirtualBox on Windows systems. It is planned to extend support to Linux systems in the future.

## Purpose
In VirtualBox, the option for nested virtualization (AMD-V) is sometimes grayed out, preventing users from enabling it. Virt-Enabler provides a basic solution to this issue by modifying VirtualBox's VM configurations to enable nested virtualization.

## Usage
1. Run the `virt-enabler.bat` script.
2. Enter a keyword to search for in the virtual machine names.
3. virt-enabler will search for the virtual machine with the specified keyword and prompt you for confirmation before making modifications.
4. If confirmed, virt-enabler will modify the virtual machine configuration to enable nested virtualization and set video memory to 256 MB.

## Planned Features
- Extend support to Linux systems.
- Improve error handling and user feedback.
- Provide options for customizing nested virtualization settings.

## Contributions
Contributions to virt-enabler are welcome! If you have ideas for improvements, bug fixes, or additional features, feel free to open an issue or submit a pull request.

## License
This project is licensed under the [MIT License](LICENSE).
