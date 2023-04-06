# BASH TOOLS
> Version Tested
```
bash --version                                                                                              130 ↵
GNU bash, version 5.1.16(1)-release (x86_64-pc-linux-gnu)
```


Get Process Info by ID
./get-pid-info.sh

```bash
╰─$ bash get-proccess-info-by-id.sh

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


Get Process Info By Name
```bash
╰─$ bash get-process-info-by-name.sh
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

Get info by user
```
╰─$ bash get-info-by-user.sh
Please enter the user name to be queried：jaf
------------------------------
The user's username：jaf
UID of this user：1000
The group for this user is：groups=1000(jaf),27(sudo),117(admin),999(docker)
The GID of this user is：1000
The home directory for this user is：/home/jaf
This user has permission to log in to the system
------------------------------
```