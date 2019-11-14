alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory level
alias c='clear'                             # c:            Clear terminal display
alias ~="cd ~"                              # ~:            Go Home
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside

# Docker
alias d="docker"
alias dc="docker-compose"

# AWS
alias aws_c="aws ecr get-login --registry-ids 925884704068 --region ap-southeast-1 --no-include-email"
alias aws_d="eval $( aws ecr get-login --registry-ids 925884704068 --region ap-southeast-1 --no-include-email)"

# Kubernetes
alias k="kubectl"

export LC_ALL=en_US.UTF-8

