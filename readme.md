# Dotfiles

## Configurations
- OSX
- Ubuntu
- Kali


## TOOLS 

TBA
- https://github.com/sharkdp/hexyl
> For Simple Hex Viewer
- https://fig.io/user-manual/autocomplete
> CLI autocomplete. 
> OSX: `brew install fig`
- https://github.com/so-fancy/diff-so-fancy 
> Better git diff


## CHEATSHEET

> BASH CheatSheet 

Copy Files with Progress Bar
```bash
rsync --progress source_file destination_directory/
```

Move Files with Progress Bar
```bash
rsync -a --progress --remove-source-files /path/to/source/ /path/to/destination/
```

Find Files from the Root without error
```bash
find / -name "flag*" 2>/dev/null 
```

Search String Keyword from files
```bash
grep -rni "keyword" directory 
```

get disk size of files, summarizing disk usages
```bash
du -sh *

# include hidden files
du -sh .[!.]* *
```


get system information
get cpu info
```bash 
lscpu
--- 
Architecture:            x86_64
  CPU op-mode(s):        32-bit, 64-bit
  Address sizes:         40 bits physical, 48 bits virtual
  Byte Order:            Little Endian
CPU(s):                  2
  On-line CPU(s) list:   0,1
Vendor ID:               AuthenticAMD
  Model name:            DO-Premium-AMD
    CPU family:          23
    Model:               49
    Thread(s) per core:  1
    Core(s) per socket:  2

```
### Shell Operators 

| Symbol / Operator |                                                                    Description                                                                   |
|:-----------------:|:------------------------------------------------------------------------------------------------------------------------------------------------:|
|         &         |                                   This operator allows you to run commands in the background of your terminal.                                   |
|         &&        |                           This operator allows you to combine multiple commands together in one line of your terminal.                           |
|         >         | This operator is a redirector - meaning that we can take the output from a command (such as using cat to output a file) and direct it elsewhere. |
|         >>        |       This operator does the same function of the > operator but appends the output rather than replacing (meaning nothing is overwritten).      |


Bash output redirection
```bash
python hello.py > output.txt            # stdout to (file)
python hello.py >> output.txt           # stdout to (file), append
python hello.py 2> error.log            # stderr to (file)
python hello.py 2>&1                    # stderr to stdout
python hello.py 2>/dev/null             # stderr to (null)
python hello.py >output.txt 2>&1        # stdout and stderr to (file), equivalent to &>
python hello.py &>/dev/null             # stdout and stderr to (null)
echo "$0: warning: too many users" >&2  # print diagnostic message to stderr
```

### Conditionals and Operands
| Operator |                                                              Description                                                             |
|:--------:|:------------------------------------------------------------------------------------------------------------------------------------:|
|    -eq   |                    Checks if the value of two operands are equal or not; if yes, then the condition becomes true.                    |
|    -ne   |            Checks if the value of two operands are equal or not; if values are not equal, then the condition becomes true.           |
|    -gt   |       Checks if the value of left operand is greater than the value of right operand; if yes, then the condition becomes true.       |
|    -lt   |         Checks if the value of left operand is less than the value of right operand; if yes, then the condition becomes true.        |
|    -ge   | Checks if the value of left operand is greater than or equal to the value of right operand; if yes, then the condition becomes true. |

Examples
```bash
[ 1 -eq 1 ] && echo "1 is equal to 1" - checks if 1 is equal to 1, and if it is, it will print "1 is equal to 1"
[ 1 -ne 2 ] && echo "1 is not equal to 2" - checks if 1 is not equal to 2, and if it is not, it will print "1 is not equal to 2"
[ 2 -gt 1 ] && echo "2 is greater than 1" - checks if 2 is greater than 1, and if it is, it will print "2 is greater than 1"
[ 1 -lt 2 ] && echo "1 is less than 2" - checks if 1 is less than 2, and if it is, it will print "1 is less than 2"
[ 2 -ge 2 ] && echo "2 is greater than or equal to 2" - checks if 2 is greater than or equal to 2, and if it is, it will print "2 is greater than or equal to 2"
```




| Bash Flag | Description                                               |
|-----------|-----------------------------------------------------------|
| -w FILE   | FILE exists and write permission is granted               |
| -x FILE   | FILE exists and execute (or search) permission is granted |
| -d FILE   | FILE exists and is a directory                            |
| -e FILE   | FILE exists                                               |
| -f FILE   | FILE exists and is a regular file                         |
| -r FILE   | FILE exists and read permission is granted                |
| -s FILE   | FILE exists and has a size greater than zero              |

Examples:

- Check if the file /home/user/file.txt exists and is a regular file:` if [ -f /home/user/file.txt ]; then echo "File exists"; fi`
- Check if the directory /home/user exists and is a directory: `if [ -d /home/user ]; then echo "Directory exists"; fi`
- Check if the file /home/user/file.txt exists, is a regular file, and has read permission: `if [ -f /home/user/file.txt ] && [ -r /home/user/file.txt ]; then echo "File exists and is readable"; fi`

## Strings

**Multiline String and Interpolation**
```bash
#!/bin/sh

placeholders="value one"
different="value two"
here="value three"
there="value four"

cat <<-_EOT_
I have some
text with ${placeholders}
in this and some ${different}
ones ${here} and ${there}.
_EOT_
```
If executed:

```bash
$ sh ./script
I have some
text with value one
in this and some value two
ones value three and value four.
```

**Multi line Strings create file** 
```
cat >> /path/to/existingFile.text<< EOF
some text line 1
some text line 2
some text line 3
EOF

#switch cat >> to cat > to create a file instead of append
cat > /path/to/newFile.text<< EOF
some text line 1
some text line 2
some text line 3
EOF

```

## PROCESSES 101

`ps aux`: To see the processes run by other users and those that don't run from a session (i.e. system processes)

`kill 1337`
You can send signals that terminate processes; there are a variety of types of signals that correlate to exactly how "cleanly" the process is dealt with by the kernel

Below are some of the signals that we can send to a process when it is killed:

- SIGTERM - Kill the process, but allow it to do some cleanup tasks beforehand
- SIGKILL - Kill the process - doesn't do any cleanup after the fact
- SIGSTOP - Stop/suspend a process


**How do Processes Start?**

Let's start off by talking about namespaces. The Operating System (OS) uses namespaces to ultimately split up the resources available on the computer to (such as CPU, RAM and priority) processes. Think of it as splitting your computer up into slices -- similar to a cake. Processes within that slice will have access to a certain amount of computing power, however, it will be a small portion of what is actually available to every process overall.

Namespaces are great for security as it is a way of isolating processes from another -- only those that are in the same namespace will be able to see each other.

**Getting Processes/Services to Start on Boot**

Some applications can be started on the boot of the system that we own. For example, web servers, database servers or file transfer servers. This software is often critical and is often told to start during the boot-up of the system by administrators.

`systemctl [option] [service]`
We can do four options with `systemctl`:
- Start
- Stop
- Enable
- Disable

## Logs
In general most logs are stored here `/var/log/`

### UBUNTU
important logs to check in ubuntu
- `/var/log/syslog`: which contains a wide range of system messages, including authentication attempts and other system events.
- `/var/log/auth.log`: authentication and authorization related messages on Ubuntu
### CENTOS
important logs to check in centos
- `/var/log/messages`: contains system messages, including authentication attempts and other system events
- `/var/log/secure`: contains authentication and authorization related messages on CentOS



## Online Tools
- explainshell.com
