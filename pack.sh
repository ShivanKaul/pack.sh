#!/usr/bin/env bash

file="extension/manifest.json"
name=$(cat "$file" | grep "\"name\"" | cut -d ":" -f2 | cut -d "," -f1 | cut -d "\"" -f2)
version=$(cat "$file" | grep "\"version\"" | cut -d ":" -f2 | cut -d "," -f1 | cut -d "\"" -f2)
echo "Current version# of $name is: $version"
find . -type f -name "$name-*.zip" -exec rm {} +

if [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX, so remove all .DS_Stores
	echo "Removing .DS_Stores..."
        find . -name '*.DS_Store' -type f -delete
	echo "Done."
fi

zip -r "$name-$version".zip extension/
