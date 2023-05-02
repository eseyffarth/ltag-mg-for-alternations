#!/bin/bash

# Script to
#  - compile all three metagrammars
#  - parse example sentences for all three metagrammars
#  - combine the parse output from all metagrammars into
#    one single file that can be uploaded and viewed at
#    xmg.phil.hhu.de

cd ./metagrammars

# Compile each metagrammar
bash ./compile_mg.sh cmciaa
bash ./compile_mg.sh ciaisa
bash ./compile_mg.sh combined

# Parse example sentences
bash ./parse_test_sentences.sh cmciaa
bash ./parse_test_sentences.sh ciaisa
bash ./parse_test_sentences.sh combined

cd ../parsed_sentences

# # Combine parse results into a single file
python3 ./merge_parse_output.py cmciaa ./cmciaa_results.xml
python3 ./merge_parse_output.py ciaisa ./ciaisa_results.xml
python3 ./merge_parse_output.py combined ./combined_results.xml

python3 ./merge_parse_output.py . ./all_parse_results.xml