# Create symlinks
sym_files=(".vimrc")
for file in "${sym_files[@]}"; do
    if [ ! -f ~/$file ]; then
        ln -s $(pwd)/$file ~/$file
        printf "Created symlink for $file"
        printf "\n"
    fi
done

# Append source lines
src_files=(".zshrc" ".zprofile")
for file in "${src_files[@]}"; do
    src_line="source $(pwd)/$file"
    # Create ~/$file if it does not exist
    if [ ! -f ~/$file ]; then
        printf "" > ~/$file
        printf "Created empty $file"
        printf "\n"
    fi
    # Append an include to the end of ~/$file to source this $file
    if ! grep -q "source $(pwd)/$file" ~/$file; then
        printf "\n" >> ~/$file
        printf "# HumbleHominid\nsource $(pwd)/$file\n# HumbleHominid end\n" >> ~/$file
        printf "Appended source line to $file"
        printf "\n"
    fi
done
