function Get-SystemUptime {
    $operatingSystem = Get-WmiObject Win32_OperatingSystem
    "$((Get-Date) - ([Management.ManagementDateTimeConverter]::ToDateTime($operatingSystem.LastBootUpTime)))"
}