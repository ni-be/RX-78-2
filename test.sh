while read -r a b c; do
  #if [ -z ${c} ]; then echo "var is unset"; else echo "var is set to '$c'"; fi
  #echo hello."$a" "$b"

arrVar+=("$b")  

done < gh-repos.txt

for value in "${arrVar[@]}"
do
     echo $value
done


function zyx() {
  while read -r a b c; do
    mkdir -p "$b"
    if [ -z ${c}]; then git clone git@github.com:"$a".git /home/nibe/"$b"; else git clone git@github.com:"$a".git /home/nibe/"$b"/"$c"; fi
  done < gh-repos.txt  
}