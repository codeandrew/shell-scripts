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
rsync -a --remove-source-files /path/to/source/ /path/to/destination/
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


