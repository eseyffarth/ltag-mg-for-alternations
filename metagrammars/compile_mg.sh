#!/bin/bash
cd "$(dirname "$0")"

# Script to compile all files from one of the metagrammars 
# in the repository.

# Metagrammar folder is selected via command line argument:
#   > bash ./compile_mg.sh [mg]

# Options for mg:
#   cmciaa
#   ciaisa
#   combined

MG=$1

# to compile the file that contains morphological information:
xmg compile mph --force "$MG"/morph.mg

# to compile the file that contains the assignment of frames to lemmas:
xmg compile lex --force "$MG"/lemma.mg

# to compile the file that contains the frames for individual lemmas, as well as
# the type hierarchy:
xmg compile synframe --force --more "$MG"/frame_dimension.mg

# to compile the file that contains syntactic trees and their frames:
xmg compile synframe --force "$MG"/syn_dimension.mg