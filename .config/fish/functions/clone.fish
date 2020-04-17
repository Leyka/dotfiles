function clone --description "Clone git repo, cd into it and install it (yarn)."
    git clone --depth=1 $argv[1]
    cd (basename $argv[1] | sed 's/.git$//')
    yarn install
end