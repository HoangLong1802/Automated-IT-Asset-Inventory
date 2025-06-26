<#
.SYNOPSIS
  Quét thông tin phần cứng và phần mềm trên máy Windows.
#>

# Thông tin đầu ra
$outputCsv = "asset_inventory_windows.csv"

# Lấy thông tin hệ thống
$computer = Get-WmiObject Win32_ComputerSystem
$os       = Get-WmiObject Win32_OperatingSystem
$cpu      = Get-WmiObject Win32_Processor
$bios     = Get-WmiObject Win32_BIOS

# Lấy danh sách phần mềm đã cài qua registry
$uninstallKey = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall"
$apps = Get-ChildItem $uninstallKey | ForEach-Object {
    $displayName = (Get-ItemProperty $_.PSPath).DisplayName
    if ($displayName) { $displayName }
}

# Xây dựng object
$record = [PSCustomObject]@{
    Timestamp      = (Get-Date).ToString("s")
    ComputerName   = $computer.Name
    Manufacturer   = $computer.Manufacturer
    Model          = $computer.Model
    OS             = $os.Caption + " " + $os.OSArchitecture
    OSVersion      = $os.Version
    CPU            = $cpu.Name
    TotalMemoryGB  = [math]::Round($computer.TotalPhysicalMemory / 1GB, 2)
    BIOSVersion    = ($bios.SMBIOSBIOSVersion)
    InstalledApps  = ($apps -join "; ")
}

# Xuất CSV
$record | Export-Csv -Path $outputCsv -NoTypeInformation -Encoding UTF8
Write-Host "Inventory saved to $outputCsv"
