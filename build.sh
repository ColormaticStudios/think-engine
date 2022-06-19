echo "building thinking engine..."

mkdir bin
crystal build src/main.cr -o bin/think

echo "build complete."
