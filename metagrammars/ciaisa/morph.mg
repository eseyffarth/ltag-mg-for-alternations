%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Morphological information for the CIA/ISA TAG fragment   %
% COMPILE WITH: mph                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file contains the inflected forms we want the       %
% parser to understand, and each form is connected to:     %         
% 1. its lemma (as specified in the lemma lexion)          % 
% 2. its syntactic category (part of speech)               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                       VERBS                          %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class MorphAte
{
  <morpho> {
    morph <- "ate";
    lemma <- "eat";
    cat <- v
  }
}

class MorphEats
{
  <morpho> {
    morph <- "eats";
    lemma <- "eat";
    cat <- v
  }
}

class MorphEat
{
  <morpho> {
    morph <- "eat";
    lemma <- "eat";
    cat <- v
  }
}

class MorphEmptied
{
  <morpho> {
    morph <- "emptied";
    lemma <- "empty";
    cat <- v
  }
}

class MorphEmpties
{
  <morpho> {
    morph <- "empties";
    lemma <- "empty";
    cat <- v
  }
}

class MorphEmpty
{
  <morpho> {
    morph <- "empty";
    lemma <- "empty";
    cat <- v
  }
}

class MorphSliced
{
  <morpho> {
    morph <- "sliced";
    lemma <- "slice";
    cat <- v
  }
}

class MorphSlices
{
  <morpho> {
    morph <- "slices";
    lemma <- "slice";
    cat <- v
  }
}

class MorphSlice
{
  <morpho> {
    morph <- "slice";
    lemma <- "slice";
    cat <- v
  }
}

class MorphBroke
{
  <morpho> {
    morph <- "broke";
    lemma <- "break";
    cat <- v
  }
}

class MorphBreaks
{
  <morpho> {
    morph <- "breaks";
    lemma <- "break";
    cat <- v
  }
}

class MorphBreak
{
  <morpho> {
    morph <- "break";
    lemma <- "break";
    cat <- v
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                       NAMES                          %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class MorphQueequeg
{
  <morpho> {
    morph <- "Queequeg";
    lemma <- "queequeg";
    cat   <- n
  }
}

class MorphDaggoo
{
  <morpho> {
    morph <- "Daggoo";
    lemma <- "daggoo";
    cat   <- n
  }
}

class MorphTashtego
{
  <morpho> {
    morph <- "Tashtego";
    lemma <- "tashtego";
    cat   <- n
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                       NOUNS                          %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class MorphSoup
{
  <morpho> {
    morph <- "soup";
    lemma <- "soup";
    cat   <- n
  }
}

class MorphSpoon
{
  <morpho> {
    morph <- "spoon";
    lemma <- "spoon";
    cat   <- n
  }
}

class MorphBucket
{
  <morpho> {
    morph <- "bucket";
    lemma <- "bucket";
    cat   <- n
  }
}

class MorphPump
{
  <morpho> {
    morph <- "pump";
    lemma <- "pump";
    cat   <- n
  }
}

class MorphCoconut
{
  <morpho> {
    morph <- "coconut";
    lemma <- "coconut";
    cat   <- n
  }
}

class MorphMachete
{
  <morpho> {
    morph <- "machete";
    lemma <- "machete";
    cat   <- n
  }
}

class MorphWindow
{
  <morpho> {
    morph <- "window";
    lemma <- "window";
    cat   <- n
  }
}

class MorphHammer
{
  <morpho> {
    morph <- "hammer";
    lemma <- "hammer";
    cat   <- n
   }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%              DETERMINERS AND PREPOSITIONS            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class MorphThe
{
  <morpho> {
    morph <- "the";
    lemma <- "the";
    cat   <- det
  }
}

class MorphWith
{
  <morpho> {
    morph <- "with";
    lemma <- "with";
    cat   <- p
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     EVALUATION                       %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

value MorphAte
value MorphEats
value MorphEat
value MorphEmptied
value MorphEmpties
value MorphEmpty
value MorphSliced
value MorphSlices
value MorphSlice
value MorphBroke
value MorphBreaks
value MorphBreak

value MorphTashtego
value MorphQueequeg
value MorphDaggoo

value MorphSoup
value MorphSpoon
value MorphBucket
value MorphPump
value MorphCoconut
value MorphMachete
value MorphWindow
value MorphHammer

value MorphThe
value MorphWith