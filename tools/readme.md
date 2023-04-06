# BASH TOOLS
> Version Tested
```
bash --version                                                                                              130 ↵
GNU bash, version 5.1.16(1)-release (x86_64-pc-linux-gnu)
```


./get-pid-info.sh
```
╰─$ bash get-pid-info.sh                                                                                            1 ↵
Please enter the PID to be queried: 211686
--------------------------------
Process PID: 211686
Process Commands：tmux
The user to which the process belongs: jaf
CPU Occupancy：0.0%
Memory Occupancy：0.6%
The time when the process started running：Jan18
Process run time：95:31
Process Status：Ss
Process Virtual Memory：66408
Process Shared Memory：25784
--------------------------------
```


```
╰─$ bash display-pid-info.sh
Please enter the name of the process to be queried：tmux
***************************************************************
Process PID: 211686
Process Commands：tmux
The user to which the process belongs: jaf
CPU Occupancy：0.0%
Memory Occupancy：0.7%
The time when the process started running：Jan18
Process run time：95:33
Process Status：Ss
Process Virtual Memory：66408
Process Shared Memory：29136
***************************************************************
***************************************************************
Process PID: 3823678
Process Commands：tmux attach-session -t 0
The user to which the process belongs: jaf
CPU Occupancy：0.0%
Memory Occupancy：0.0%
The time when the process started running：05:11
Process run time：0:00
Process Status：S+
Process Virtual Memory：8312
Process Shared Memory：3692
***************************************************************

```
