function gitcd ( [string]$path, [string]$branch) {
  cd $path
  git checkout $branch
}

Set-Alias git-cd gitcd
