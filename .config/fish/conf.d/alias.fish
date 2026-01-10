function ll --wraps='ls -AhlX --color=always' --description 'alias ll=ls -AhlX --color=always'
    ls -AhlX --color=always $argv
end

function ls --description 'alias ls=ls -pt --color=always'
    command ls -pt --color=always $argv
end

function lt --wraps='ls -RU --color=always' --description 'alias lt=ls -RU --color=always'
    ls -RU --color=always $argv
end
