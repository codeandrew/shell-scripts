## ZIP Files

things to do before opening a zip file

### Step 1: Verify the File (Check SHA256 Hash)

1. **Navigate to the directory where you downloaded the file**:
   ```bash
   cd /path/to/your/downloads
   ```

2. **Check for unusual extensions inside the ZIP**:
   - **List the ZIP’s contents without extracting** to spot any suspicious file types (e.g., `.exe`, `.scr`, `.js`, etc.):
   ```bash
   unzip -l yourfile.zip
   ```

### Step 2: Examine File Contents Without Extracting

1. **Inspect file names and paths for suspicious patterns**:
   - Look for attempts at directory traversal (e.g., `../` in file paths) or unusual names.
   ```bash
   unzip -Z1 yourfile.zip
   ```
   - This gives a concise list of paths without details.

2. **Check file signatures to see the types of files within**:
   - For example, `.pdf` files should start with `%PDF` and `.jpg` with `FFD8`.
   ```bash
   unzip -p yourfile.zip | file -
   ```

### Step 3: Extract Safely in an Isolated Environment

1. **Use a Sandbox Directory for Extraction**:
   - Create a temporary isolated directory to extract files.
   ```bash
   mkdir ~/sandbox && cd ~/sandbox
   unzip /path/to/yourfile.zip
   ```

2. **Check the extracted files' permissions and contents**:
   - Look for executable permissions that may hint at potential threats.
   ```bash
   find . -type f -exec ls -l {} \;
   ```

3. **Check contents of text-based files safely**:
   - Open any `.txt`, `.pdf`, `.md`, or `.html` files with `less`, `cat`, or a basic text editor, without executing any code within.
   ```bash
   less suspicious_file.txt
   ```

### Step 4: Scan for Malware

1. **Use macOS's built-in malware scanner (`XProtect`)**:
   - Unfortunately, there’s no direct command for this, but copying or moving the file to a different directory may trigger XProtect scans automatically.

2. **Use VirusTotal to scan the file**:
   - You can upload the file manually at [VirusTotal](https://www.virustotal.com/) or use their API to scan from the command line if you’re set up.

### Step 5: Delete Files and Clear Directory if Suspicious

If anything looks off, delete the file:
```bash
rm -rf ~/sandbox
rm /path/to/yourfile.zip
```

---

### Opinion: Worst and Best Case Scenarios

**Best Case**: The file is safe, and you've verified the contents. You can proceed to use it without concerns.
**Worst Case**: A malicious script or malware was hiding in the ZIP. By extracting it in an isolated environment and analyzing it without direct execution, you’ve minimized your exposure. This approach avoids immediate compromise of your system. 
**Final Recommendation**: Always isolate, verify, and inspect before execution. Maintain cautious practices, even when receiving files from known sources.
