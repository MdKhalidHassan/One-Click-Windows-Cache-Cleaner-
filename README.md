# One-Click-Windows-Cache-Cleaner — Description

A compact Windows batch script that performs a quick "full cache" cleanup by removing various temporary and prefetch files, then launching the Disk Cleanup tool. It is intended to free disk space and remove common temporary/junk files.

## What it does
- Cleans the Windows Prefetch folder:
  - del /s /q C:\Windows\Prefetch\*.*
  - Removes prefetch files which are used by Windows to speed application startup. Removing them is safe but may temporarily slow the first launch of some apps until new prefetch files are re-created.
- Cleans system TEMP folders:
  - del /s /q "%SystemRoot%\Temp\*.*"
  - del /s /q "C:\Windows\Temp\*.*"
  - Deletes files from the Windows system temporary directories.
- Cleans the current user's temporary folder:
  - del /s /q "%temp%\*.*"
  - Removes files in the %TEMP% location for the user who runs the script.
- Runs Disk Cleanup (Cleanmgr) with a preset configuration:
  - cleanmgr /sagerun:99
  - This runs Disk Cleanup using the settings stored under the "99" profile (you can configure those via `cleanmgr /sageset:99`).
- Suppresses command output and error messages (redirects to nul) and displays a final "Done!" message followed by a pause so the user can see the result.

## When to use
- Periodic maintenance to free disk space and remove temporary/junk files.
- Before creating system backups or handing a PC to another user (to reduce unnecessary temp files).
- On systems where temporary file accumulation is a concern.

## Usage
- Save as `Clean All.bat`.
- Right-click and choose "Run as administrator" (recommended). Deleting files in system folders and running Disk Cleanup often requires elevated privileges.
- Optionally, first run `cleanmgr /sageset:99` to choose the Disk Cleanup options you want invoked by `/sagerun:99`.

Example:
1. Open an elevated command prompt.
2. Run:
   - cleanmgr /sageset:99
   - Configure options, click OK.
3. Double-click `Clean All.bat` or run it from the elevated command prompt.

## Compatibility
- Windows (supports versions with cleanmgr and Prefetch folder: Windows 7, 8, 10, 11).
- Requires appropriate permissions to delete system files and folders.

## Warnings and considerations
- This script permanently deletes files from the listed folders. Files in use may not be removable.
- Deleting Prefetch files is safe but may temporarily affect application startup performance until new prefetch data is generated.
- Some applications may store data in %TEMP% that you might not want deleted (e.g., unsaved installers or log files). Verify before running if you are unsure.
- Consider creating a system restore point or backup if you are concerned about unintended side effects.
- The script suppresses output and errors, so you won't see details about files that failed to delete. Remove the `>nul 2>&1` redirections for debugging or visibility.

## Customization ideas
- Remove the redirections (`>nul 2>&1`) to see which files are being deleted and any errors.
- Add logging to a file to keep a record of cleaned items.
- Add checks for administrative privileges and prompt the user or elevate automatically.
- Add exclusions for specific files or folders you want to keep.

## Example safer alternative
- Instead of mass deletion, consider selectively deleting large or old files, or using Disk Cleanup / Storage Sense for more controlled cleanup.

---
This description can be included in your repository as a README, a comment header in the batch file, or as documentation for users who will run the script.
