  while read -r a b c; do
    echo "$b"
    if  [-z $c]; then echo"'$a' /home/nibe/'$b'"; else echo "$c"; fi
  done < gh-repos.txt  
