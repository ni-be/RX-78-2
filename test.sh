
function zyx() {
  while read -r a b c; do
    mkdir -p "$b"
    if [ -z ${c}]; then git clone git@github.com:"$a".git /home/nibe/"$b"; else git clone git@github.com:"$a".git /home/nibe/"$b"/"$c"; fi
  done < gh-repos.txt  
}