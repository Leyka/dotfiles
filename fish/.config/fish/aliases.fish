# navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end

# utilities
alias cc 'clear'
function grep     ; command grep --color=auto $argv ; end

# files
alias ll 'ls -hla --color=auto'
alias ls 'ls -F --color=auto'
alias lt 'ls --human-readable --size -1 -S --classify --color=auto'
alias cx 'chmod +x'

# disk
alias df 'df -h'