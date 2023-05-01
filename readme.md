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



