# $1: repo name
# $2: repo description

[ -e repo_data.txt ] || cp /gahag/programming/projects/aeds/repo_data.txt .

curl -u 'gahag' https://api.github.com/user/repos -d "$(repo_data "$@")"

#git remote add origin git@github.com:gahag/$1.git
#git push origin master
