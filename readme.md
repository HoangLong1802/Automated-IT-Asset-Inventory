# Automated IT Asset Inventory

This project provides cross-platform scripts to automatically collect hardware and software information on Windows and Linux systems.

GitHub Repository: https://github.com/HoangLong1802/Automated-IT-Asset-Inventory

## 📦 Features

- Collects system hardware info (CPU, RAM, BIOS, OS version).
- Lists installed software/packages.
- Supports both Windows (PowerShell) and Linux (Python + Bash).
- Exports data to CSV files.
- Saves execution logs for troubleshooting and auditing.

## 🛠 Technologies Used

- PowerShell (Windows scripting)
- Python 3 (Linux scripting)
- Bash, Batch scripting (automation wrappers)
- CSV for export
- Git for version control

## 🧭 Setup Instructions by Operating System

### Windows

1. Install Git for Windows: https://git-scm.com/
2. Install PowerShell 5+ if not available: https://learn.microsoft.com/en-us/powershell/
3. Open PowerShell as Administrator
4. Clone the repository:

   git clone https://github.com/HoangLong1802/Automated-IT-Asset-Inventory.git
   cd Automated-IT-Asset-Inventory

5. Allow script execution (if needed):

   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

6. Run the script:

   .\window\inventory_windows.ps1

7. Output:
   - asset_inventory_windows.csv: hardware/software info
   - logs\windows_inventory.log: execution log

### Linux (Ubuntu/Debian)

1. Open Terminal
2. Install Python 3:

   sudo apt update
   sudo apt install python3 -y

3. Clone the repository:

   git clone https://github.com/HoangLong1802/Automated-IT-Asset-Inventory.git
   cd Automated-IT-Asset-Inventory

4. Make the script executable:

   chmod +x run_inventory.sh

5. Run the script:

   ./run_inventory.sh

6. Output:
   - asset_inventory_linux.csv: collected inventory
   - logs/linux_inventory.log: execution log

## 📄 Output Files

- CSV file with system details:
  - Hostname, OS, CPU, RAM, BIOS
  - Installed applications/packages
- logs/ directory contains timestamped logs for each run

## 🔧 Customization

- Modify inventory_windows.ps1 or inventory_linux.py to:
  - Include disk, GPU, or network information
  - Export to JSON, Excel, or other formats
  - Schedule regular scans (Task Scheduler/Cron)

## 🙋‍♂️ Contributions & Feedback

Feel free to fork, submit issues, or send pull requests!

GitHub Repository: https://github.com/HoangLong1802/Automated-IT-Asset-Inventory

---

Created as part of an IT Helpdesk lab simulation project.

