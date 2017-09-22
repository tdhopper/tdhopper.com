SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for file in `ag date: -L`
do
    awk '/aliases: \[(.*)\]/ { print "aliases: [" substr(FILENAME, 0, 10) $2 } // { print }' "$file" > "$file".tmp
    cp "$file.tmp" "$file"
done
IFS=$SAVEIFS