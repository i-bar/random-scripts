GITHUB_USERNAME="i-bar"
REPONAME="$1"

# Call github API to create repo
curl -u "$GITHUB_USERNAME" https://api.github.com/user/repos -d "{\"name\": \"${REPONAME:-$PWD}\", \"private\": false, \"has_issues\": true, \"has_downloads\": true, \"has_wiki\": true}"

# Clone the repo here and open the page
git clone https://github.com/$GITHUB_USERNAME/${REPONAME}.git
open https://www.github.com/$GITHUB_USERNAME/${REPONAME}

echo "Finished, completed, my work here is done!"