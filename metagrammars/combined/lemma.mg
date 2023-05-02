%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Lexical information for the combined TAG fragment        %
% COMPILE WITH: lex                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file contains the lemmas we want the parser to      %
% understand, and each lemma is connected to:              %         
% 1. its semantic frame (as specified in the frame         %
%    dimension)                                            % 
% 2. its syntactic category                                %
% 3. the syntactic tree(s) it can anchor                   % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                       VERBS                          %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    Non-alternating, intransitive verbs                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
class LemmaLaugh
{
  <lemma> {
    entry <- "laugh";
    sem <- FrameLaugh;
    cat <- v;
    fam <- RegularIntransitiveVerbFamily
  }
}

class LemmaDance
{
  <lemma> {
    entry <- "dance";
    sem <- FrameDance;
    cat <- v;
    fam <- RegularIntransitiveVerbFamily
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    Non-alternating, transitive verbs                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class LemmaInsert
{
  <lemma> {
    entry <- "insert";
    sem <- FrameInsert;
    cat <- v;
    fam <- RegularTransitiveVerbFamily
  }
}

class LemmaPush
{
  <lemma> {
    entry <- "push";
    sem <- FramePush;
    cat <- v;
    fam <- RegularTransitiveVerbFamily
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%     IAA-alternating verbs                              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
class LemmaJump
{
  <lemma> {
      entry <- "jump";
      sem <- FrameJump;
      cat <- v;
      fam <- RegularIntransitiveVerbFamily
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    Non-alternating verbs                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class LemmaEat
{
  <lemma> {
    entry <- "eat";
    sem <- FrameEat;
    cat <- v;
    fam <- RegularVerbFamily
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    CIA-alternating verbs                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class LemmaEmpty
{
  <lemma> {
    entry <- "empty";
    sem <- FrameEmpty;
    cat <- v;
    fam <- RegularVerbFamily
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    ISA-alternating verbs                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class LemmaSlice
{
  <lemma> {
    entry <- "slice";
    sem <- FrameSlice;
    cat <- v;
    fam <- RegularTransitiveVerbFamily
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    CIA-and-ISA-alternating verbs                       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class LemmaBreak
{
  <lemma> {
    entry <- "break";
    sem <- FrameBreak;
    cat <- v;
    fam <- RegularVerbFamily
  }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                       NAMES                          %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


class LemmaQueequeg
{
  <lemma> {
      entry <- "queequeg";
      sem <- FrameQueequeg;
      cat <- n;
      fam <- Propernoun
  }
}

class LemmaDaggoo
{
  <lemma> {
      entry <- "daggoo";
      sem <- FrameDaggoo;
      cat <- n;
      fam <- Propernoun
  }
}

class LemmaTashtego
{
  <lemma> {
      entry <- "tashtego";
      sem <- FrameTashtego;
      cat <- n;
      fam <- Propernoun
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                       NOUNS                          %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class LemmaHorse
{
  <lemma> {
    entry <- "horse";
    sem <- FrameHorse;
    cat <- n;
    fam <- Commonnoun
  }
}

class LemmaFence
{
  <lemma> {
    entry <- "fence";
    sem <- FrameFence;
    cat <- n;
    fam <- Commonnoun
  }
}

class LemmaKey
{
  <lemma> {
    entry <- "key";
    sem <- FrameKey;
    cat <- n;
    fam <- Commonnoun
  }
}

class LemmaLock
{
  <lemma> {
    entry <- "lock";
    sem <- FrameLock;
    cat <- n;
    fam <- Commonnoun
  }
}

class LemmaSoup
{
  <lemma> {
      entry <- "soup";
      sem <- FrameSoup;
      cat <- n;
      fam <- Commonnoun
  }
}

class LemmaSpoon
{
  <lemma> {
      entry <- "spoon";
      sem <- FrameSpoon;
      cat <- n;
      fam <- Commonnoun
  }
}

class LemmaBucket
{
  <lemma> {
      entry <- "bucket";
      sem <- FrameBucket;
      cat <- n;
      fam <- Commonnoun
  }
}

class LemmaPump
{
  <lemma> {
      entry <- "pump";
      sem <- FramePump;
      cat <- n;
      fam <- Commonnoun
  }
}

class LemmaCoconut
{
  <lemma> {
      entry <- "coconut";
      sem <- FrameCoconut;
      cat <- n;
      fam <- Commonnoun
  }
}

class LemmaMachete
{
  <lemma> {
      entry <- "machete";
      sem <- FrameMachete;
      cat <- n;
      fam <- Commonnoun
  }
}

class LemmaWindow
{
  <lemma> {
      entry <- "window";
      sem <- FrameWindow;
      cat <- n;
      fam <- Commonnoun
  }
}

class LemmaHammer
{
  <lemma> {
      entry <- "hammer";
      sem <- FrameHammer;
      cat <- n;
      fam <- Commonnoun
  }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%              DETERMINERS AND PREPOSITIONS            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class LemmaThe
{
  <lemma> {
    entry <- "the";
    sem <- FrameDummy;
    cat <- det;
    fam <- Determiner
  }
}


class LemmaTo
{
  <lemma> {
    entry <- "to";
    sem <- FrameTo;
    cat   <- p;
    fam <- DirectedMotion
  }
}

class LemmaOver
{
  <lemma> {
    entry <- "over";
    sem <- FrameOver;
    cat   <- p;
    fam <- DirectedMotion
  }
}

class LemmaFrom
{
  <lemma> {
    entry <- "from";
    sem <- FrameFrom;
    cat   <- p;
    fam <- DirectedMotion
  }
}

class LemmaInto
{
  <lemma> {
    entry <- "into";
    sem <- FrameInto;
    cat   <- p;
    fam <- DirectedMotion
  }
}

class LemmaWith
{
  <lemma> {
    entry <- "with";
    sem <- FrameWith;
    cat <- p;
    fam <- InstrumentWithConstruction
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     EVALUATION                       %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

value LemmaLaugh
value LemmaDance
value LemmaInsert
value LemmaPush
value LemmaJump

value LemmaEat
value LemmaEmpty
value LemmaSlice
value LemmaBreak

value LemmaTashtego
value LemmaQueequeg
value LemmaDaggoo

value LemmaHorse
value LemmaFence
value LemmaKey
value LemmaLock

value LemmaSoup
value LemmaSpoon
value LemmaBucket
value LemmaPump
value LemmaCoconut
value LemmaMachete
value LemmaWindow
value LemmaHammer

value LemmaTo
value LemmaOver
value LemmaFrom
value LemmaInto

value LemmaWith

value LemmaThe