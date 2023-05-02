%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Morphological information for the CMC/IAA TAG fragment   %
% COMPILE WITH: mph                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file contains the inflected forms we want the       %
% parser to understand, and each form is connected to:     %         
% 1. its lemma (as specified in the lemma lexion)          % 
% 2. its syntactic category (roughly: part of speech)      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                       VERBS                          %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class MorphLaughed
{
  <morpho> {
    morph <- "laughed";
    lemma <- "laugh";
    cat <- v
  }
}

class MorphLaughs
{
  <morpho> {
    morph <- "laughs";
    lemma <- "laugh";
    cat <- v
  }
}

class MorphLaugh
{
  <morpho> {
    morph <- "laugh";
    lemma <- "laugh";
    cat <- v
  }
}

class MorphDanced
{
  <morpho> {
    morph <- "danced";
    lemma <- "dance";
    cat <- v
  }
}

class MorphDances
{
  <morpho> {
    morph <- "dances";
    lemma <- "dance";
    cat <- v
  }
}

class MorphDance
{
  <morpho> {
    morph <- "dance";
    lemma <- "dance";
    cat <- v
  }
}

class MorphInserted
{
  <morpho> {
    morph <- "inserted";
    lemma <- "insert";
    cat <- v
  }
}

class MorphInserts
{
  <morpho> {
    morph <- "inserts";
    lemma <- "insert";
    cat <- v
  }
}

class MorphInsert
{
  <morpho> {
    morph <- "insert";
    lemma <- "insert";
    cat <- v
  }
}

class MorphPushed
{
  <morpho> {
    morph <- "pushed";
    lemma <- "push";
    cat <- v
  }
}

class MorphPushes
{
  <morpho> {
    morph <- "pushes";
    lemma <- "push";
    cat <- v
  }
}

class MorphPush
{
  <morpho> {
    morph <- "push";
    lemma <- "push";
    cat <- v
  }
}

class MorphJumped
{
  <morpho> {
    morph <- "jumped";
    lemma <- "jump";
    cat <- v
  }
}

class MorphJumps
{
  <morpho> {
    morph <- "jumps";
    lemma <- "jump";
    cat <- v
  }
}

class MorphJump
{
  <morpho> {
    morph <- "jump";
    lemma <- "jump";
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

class MorphHorse
{
  <morpho> {
    morph <- "horse";
    lemma <- "horse";
    cat   <- n
  }
}

class MorphFence
{
  <morpho> {
    morph <- "fence";
    lemma <- "fence";
    cat   <- n
  }
}

class MorphKey
{
  <morpho> {
    morph <- "key";
    lemma <- "key";
    cat   <- n
  }
}

class MorphLock
{
  <morpho> {
    morph <- "lock";
    lemma <- "lock";
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

class MorphTo
{
  <morpho> {
    morph <- "to";
    lemma <- "to";
    cat   <- p
  }
}

class MorphOver
{
  <morpho> {
    morph <- "over";
    lemma <- "over";
    cat   <- p
  }
}

class MorphFrom
{
  <morpho> {
    morph <- "from";
    lemma <- "from";
    cat   <- p
  }
}

class MorphInto
{
  <morpho> {
    morph <- "into";
    lemma <- "into";
    cat   <- p
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     EVALUATION                       %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

value MorphLaughed
value MorphLaughs
value MorphLaugh
value MorphDanced
value MorphDances
value MorphDance
value MorphInserted
value MorphInserts
value MorphInsert
value MorphPushed
value MorphPushes
value MorphPush
value MorphJumped
value MorphJumps
value MorphJump

value MorphTashtego
value MorphQueequeg
value MorphDaggoo

value MorphHorse
value MorphFence
value MorphKey
value MorphLock

value MorphThe
value MorphTo
value MorphOver
value MorphFrom
value MorphInto