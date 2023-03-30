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

