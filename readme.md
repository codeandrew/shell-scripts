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
