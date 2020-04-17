# navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end

# utilities
function grep     ; command grep --color=auto $argv ; end

# files
alias ll 'ls -hla'
alias ls 'ls -F'
alias lt 'ls --human-readable --size -1 -S --classify'
alias cx 'chmod +x'
alias count 'find . -type f | wc -l' # count files

# disk
alias df 'df -h'

# git
alias g 'git'
alias gs 'git status -s'