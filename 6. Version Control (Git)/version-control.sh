# 2.2
git log -1 --format=%aN --follow README.md
# 2.3
git blame -L :collections _config.yml | head -n 1 | cut -d ' ' -f 1 | xargs git show -s --format='%s'
# 3
git filter-repo --invert-paths --path sensitive.txt
# 5
git config alias.graph 'log --all --graph --decorate --oneline'
