echo Pull from branch deploy
git pull 
echo Increase version
npm version patch -git-tag-version -s
echo Push to repo 
git push origin master
