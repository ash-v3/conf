function commit_update
  git add -A
  git status
  git commit -m "update"
  git push
end
