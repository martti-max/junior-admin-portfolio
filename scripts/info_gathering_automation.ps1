$ComputerName = "PC-JADZIA" 

Clear-Host
Write-Host "Connecting to machine: $ComputerName..." -ForegroundColor Cyan

try {
    # 1. Operating System
    $OSInfo = Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $ComputerName -ErrorAction Stop

    # 2. Processor
    $CPUInfo = Get-CimInstance -ClassName Win32_Processor -ComputerName $ComputerName

    # 3. RAM and Computer Model
    $SysInfo = Get-CimInstance -ClassName Win32_ComputerSystem -ComputerName $ComputerName
    $RamGB = [math]::Round($SysInfo.TotalPhysicalMemory / 1GB, 2)

    # 4. Drive C info
    #
    $DiskInfo = Get-CimInstance -ClassName Win32_LogicalDisk -ComputerName $ComputerName | Where-Object DeviceID -eq "C:"
    
    # converting bytes into gigabytes for clarity
    $FreeSpaceGB = [math]::Round($DiskInfo.FreeSpace / 1GB, 2)
    $TotalSpaceGB = [math]::Round($DiskInfo.Size / 1GB, 2)

    # 5. Building the report
    $Raport = [PSCustomObject]@{
        Computer      = $SysInfo.Name
        User    = $SysInfo.UserName
        System        = $OSInfo.Caption
        Processor      = $CPUInfo.Name
        RAM_Total_GB  = $RamGB
        Drive_C_Free  = "$FreeSpaceGB GB"
        Drive_C_Total = "$TotalSpaceGB GB"
    }

    # Display the results
    Write-Host "Success! Here's the data:" -ForegroundColor Green
    $Raport | Format-List

    # Save in CSV format on the desktop
    $Path = "$env:USERPROFILE\Desktop\Raport_$ComputerName.csv"
    $Raport | Export-Csv -Path $Path -NoTypeInformation -Encoding UTF8
    Write-Host "Report saved on the desktop successfully: $Path" -ForegroundColor Yellow

} catch {
    Write-Error "Couldn't connect to machine $ComputerName. Please check if the machine is working and if you have the admin rights!"
}