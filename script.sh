# Install all fonts from Google Fonts
#
# (C) Elias Ojala <elias@eliasojala.me>
# https://github.com/theel0ja

FONTS_FOLDER=$HOME/Fonts/GoogleFonts/

mkdir -p $FONTS_FOLDER

git clone https://github.com/google/fonts

function move_to_folder {
    while read font_path
    do

    echo "Processing font: $font_path"

    cp $font_path $FONTS_FOLDER

    done < "${1:-/dev/stdin}"
}

find ./fonts -type f | grep -v .git \
| grep -v ".txt" | grep -v ".md" | grep -v ".sh" | grep -v ".html" | grep -v ".category" \
| grep -v "METADATA" | grep -v "README" | grep -v "AUTHORS" | grep -v "CONTRIBUTORS" \
| grep -v ".lao" | grep -v ".korean" | grep -v ".tamil" | grep -v ".bengali" | move_to_folder
