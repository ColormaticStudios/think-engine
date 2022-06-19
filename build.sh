echo "building thinking engine..."


mkdir bin
crystal build src/main.cr -o bin/think


if [ $? = 0 ]; then
   echo "build successful."
else
   echo "build failed with exit code $?"
fi
