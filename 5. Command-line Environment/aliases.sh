# 1
alias dc=cd
# 2
history 1 | awk '{$1="";print substr($0,2)}' | sort | uniq -c | sort -n | tail -n 35
alias emasc=emacs
