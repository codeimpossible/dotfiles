lastDir=$(pwd)
currentFilePath="$(readlink ~/.zshrc)"
zshHomeDir="$(dirname $currentFilePath)"
dotFilesHome="$(cd $zshHomeDir && cd .. && pwd)"

DIR="$dotFilesHome"
pushd $DIR > /dev/null 2>&1
source .localrc
popd > /dev/null 2>&1
export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)\n$ '

