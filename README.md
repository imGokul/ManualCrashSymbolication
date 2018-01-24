# Manual Crash Symbolication - iOS
For some reason if your xcode is failing to symbolicate your crash file you can follow this manual symbolication process.
With this script you should able to symbolicate multiple crash files in one go. Also provided with multiple dSYM files of app, frameworks, etc. script will use all symbol tables files to map every crash log.

## Prerequisite
  1. Mac with Xcode installed
  2. crash file(s)
  3. dSYM file(s)
  4. yourApp.app
  
## Steps
  1. Create new folder and place all your **.crash** files along with **.dSYM** and **yourApp.app**
      - dSYM files can be obtained from archive or can be downloaded from iTunesConnect
  2. Download and copy [symbolicate.sh](https://github.com/imGokul/ManualCrashSymbolication/blob/master/symbolicate.sh) to the same folder
  3. Open terminal or command line 
  4. Navigate to above folder location and execute 
    ```
    sh symbolicate.sh
    ```
  4. Observe symbolicated crash logs in the same folder



###### Note:
If you observe empty or unsymbolicated crash report do open [symbolicate.sh](https://github.com/imGokul/ManualCrashSymbolication/blob/master/symbolicate.sh) and update symbolicatecrash path with suitable value. Correct path for your xcode version can be found using ```find /Applications/xCode.app -name symbolicatecrash -type f```

To understand and analyzing application crash reports visit <https://developer.apple.com/library/content/technotes/tn2151/_index.html>
