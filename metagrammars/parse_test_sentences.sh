#!/bin/bash
cd "$(dirname "$0")"

# Script to parse all test sentences for one of the
# metagrammars.

# Metagrammar folder is selected via command line argument:
#   > bash ./compile_mg.sh [mg]

# Options for mg:
#   cmciaa
#   ciaisa
#   combined

MG=$1
INFILE="$MG"/example_sentences.txt
OUTFOLDER="../parsed_sentences"


# sentence="Queequeg eats the soup"

cat "$INFILE" | while read sentence
do
    outpath="$OUTFOLDER/$MG/${sentence// /_}.xml"
    mkdir -p "$(dirname "${outpath}")"
    java -jar ~/TuLiPA-frames/TuLiPA-frames.jar -g "$MG"/syn_dimension.xml -f "$MG"/frame_dimension.xml -th "$MG"/frame_dimension_more.mac -l "$MG"/lemma.xml -m "$MG"/morph.xml -a s -s "$sentence" -xg -o "$outpath"
done