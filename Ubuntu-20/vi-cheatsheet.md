# Vi Cheat sheet

## VIM shortcut 
```
<c-f>  page up
<c-b>  page down 

0 start line
$ end line

zt
zz
zb

dto delete till "o"
dt<character>

U uppercase
u lowercase

ci<character> change inside "
ci" 
ci[   change inside [
ci{   change inside { 

set hlsearch
:let @/=''

:%s/<word>/<word>/g find and replace
:%s/the/ang/g
```

## Space Vim 


### 1. Shortcuts
There are different kinds of shortcuts, start with different prefix:

| Prefix  | Prefix name | Example   | Description                     | More info                                                            |
| ------- | ----------- | --------- | ------------------------------- | -------------------------------------------------------------------- |
| `space` | `[SPC]`     | `spc f t` | open/close filetree             | just press space key and wait 1s                                     |
| `s`     | `[WIN]`     | `s v`     | split window, equal to `:split` | [link](https://spacevim.org/documentation/#window-manager)           |
| `\`     | `<Leader>`  | `\ [0-9]` | jump to other tab or buffer     | just press `\` key and wait 1s                                       |
| `g`     | go to       | `g 0`     | go to first tab                 | [link](https://spacevim.org/documentation/#commands-starting-with-g) |
| `z`     | fold        | `z a`     | toggle a fold                   | [link](https://spacevim.org/documentation/#commands-starting-with-z) |



