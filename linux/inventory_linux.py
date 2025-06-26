#!/usr/bin/env python3
import csv
import platform
import subprocess
from datetime import datetime

def get_installed_packages():
    try:
        # Dùng dpkg trên Debian/Ubuntu
        result = subprocess.run(["dpkg-query", "-W", "-f=${binary:Package}\n"], 
                                 stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True)
        return result.stdout.splitlines()
    except:
        return []

def main():
    output_csv = "asset_inventory_linux.csv"
    data = {
        "Timestamp": datetime.now().isoformat(),
        "Hostname": platform.node(),
        "OS": f"{platform.system()} {platform.release()}",
        "Architecture": platform.machine(),
        "CPU": platform.processor(),
    }

    # Lấy RAM, Disk
    try:
        mem = subprocess.check_output(["free", "-m"], text=True).splitlines()[1].split()
        data["TotalMemoryMB"] = mem[1]
    except:
        data["TotalMemoryMB"] = ""

    # Lấy list package
    apps = get_installed_packages()
    data["InstalledPackages"] = ";".join(apps)

    # Ghi CSV
    with open(output_csv, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=data.keys())
        writer.writeheader()
        writer.writerow(data)

    print(f"Inventory saved to {output_csv}")

if __name__ == "__main__":
    main()
