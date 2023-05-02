%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Frame information for the CIA/ISA TAG fragment           %
% COMPILE WITH: synframe                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file contains the frames for tokens that we list in %
% the lemma lexicon.                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

type NAME = {Tashtego, Queequeg, Daggoo}
type LABEL !
type LABEL_I !
type LABEL_E !

% Interface Features
feature i : LABEL_I
feature e : LABEL_E

include type_hierarchy.mg

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                      FRAMES                          %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                       VERBS                          %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class FrameEat
declare ?X0
{
  <frame>{
    ?X0[eating]
  };
  <iface>{
    [e=?X0]
  }
}

class FrameEmpty
declare ?X0 ?X1
{
  <frame>{
    ?X0[becoming_empty,
        undergoer: ?X1,
        theme: ?X1,
        result: [being_empty,
                theme: ?X1]]
  };
  <iface>{
    [e=?X0]
  }
}

class FrameSlice
declare ?X0 ?X1 ?X2 ?X3
{
  <frame>{
    ?X0[slicing,
      cause: ?X1[event,
                undergoer: ?X2],
      effect: ?X3[change_of_state,
                  undergoer: ?X2,
                  theme: ?X2,
                  result: [being_sliced,
                          theme: ?X2]]]
  };
  <iface>{
    [e=?X0]
  }
}

class FrameBreak
declare ?X0 ?X1 %?X2 ?X3
{
  <frame>{
    ?X0[becoming_broken,
        theme: ?X1,
        undergoer: ?X1,
        result: [being_broken,
                theme: ?X1]]
  };
  <iface>{
    [e=?X0]
  }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                       NAMES                          %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class FrameQueequeg
declare ?X0
{
  <frame>{
    ?X0[person,
        name: Queequeg]
  };
  <iface>{
    [i=?X0]
  }
}

class FrameDaggoo
declare ?X0
{
  <frame>{
    ?X0[person,
        name: Daggoo]
  };
  <iface>{
    [i=?X0]
  }
}

class FrameTashtego
declare ?X0
{
  <frame>{
    ?X0[person,
        name: Tashtego]
  };
  <iface>{
    [i=?X0]
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                       NOUNS                          %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class FrameSoup
declare ?X0
{
  <frame>{
    ?X0[soup]
  };
  <iface>{
    [i=?X0]
  }
}

class FrameSpoon
declare ?X0
{
  <frame>{
    ?X0[spoon]
  };
  <iface>{
    [i=?X0]
  }
}

class FrameBucket
declare ?X0
{
  <frame>{
    ?X0[bucket]
  };
  <iface>{
    [i=?X0]
  }
}

class FramePump
declare ?X0
{
  <frame>{
    ?X0[pump]
  };
  <iface>{
    [i=?X0]
  }
}

class FrameCoconut
declare ?X0
{
  <frame>{
    ?X0[coconut]
  };
  <iface>{
    [i=?X0]
  }
}


class FrameMachete
declare ?X0
{
  <frame>{
    ?X0[machete]
  };
  <iface>{
    [i=?X0]
  }
}

class FrameWindow
declare ?X0
{
  <frame>{
    ?X0[window]
  };
  <iface>{
    [i=?X0]
  }
}

class FrameHammer
declare ?X0
{
  <frame>{
    ?X0[hammer]
  };
  <iface>{
    [i=?X0]
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%              DETERMINERS AND PREPOSITIONS            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Semantically-empty frame that is associated with the
% determiner "the" (simplification)
class FrameDummy

class FrameWith
declare ?W ?X0
{
  <frame>{
    ?W[activity,
    instrument: ?X0]
  };
  <iface>{
    [e=?W]
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     EVALUATION                       %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

value FrameEat
value FrameEmpty
value FrameSlice
value FrameBreak

value FrameTashtego
value FrameQueequeg
value FrameDaggoo

value FrameSoup
value FrameSpoon
value FrameBucket
value FramePump
value FrameCoconut
value FrameMachete
value FrameWindow
value FrameHammer

value FrameDummy
value FrameWith