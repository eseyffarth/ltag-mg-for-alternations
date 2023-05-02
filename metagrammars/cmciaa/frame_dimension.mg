%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Frame information for the CMC/IAA TAG fragment           %
% COMPILE WITH: synframe                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file contains the frames for tokens that we list in %
% the lemma lexicon.                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

type NAME = {Tashtego, Queequeg, Daggoo}
type TRAJECTORY = {to, over, from, into}
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

class FrameLaugh
declare ?X0
{
  <frame>{
    ?X0[laughing]
  };
  <iface>{
    [e=?X0]
  }
}

class FrameDance
declare ?X0
{
  <frame>{
    ?X0[dancing]
  };
  <iface>{
    [e=?X0]
  }
}

class FrameInsert
declare ?X0 ?Cause ?X1 ?X2 ?X3 ?Effect ?Path
{
  <frame>{
    ?X0[inserting,
    actor: ?X1,
    undergoer: ?X2,
    cause:?Cause[
        undergoer:?X2],
    effect:?Effect[mover:?X2,
        undergoer:?X2,
        path:?Path[path,
                  landmark: ?X3,
                  trajectory: into]]]
  };
  <iface>{
    [e=?X0]
  }
}

class FramePush
declare ?X0
{
  <frame>{
    ?X0[pushing]
  };
  <iface>{
    [e=?X0]
  }
}

class FrameJump
declare ?X0
{
  <frame>{
    ?X0[jumping]
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

class FrameHorse
declare ?X0
{
  <frame>{
    ?X0[horse]
  };
  <iface>{
    [i=?X0]
  }
}

class FrameFence
declare ?X0
{
  <frame>{
    ?X0[fence]
  };
  <iface>{
    [i=?X0]
  }
}

class FrameKey
declare ?X0
{
  <frame>{
    ?X0[key]
  };
  <iface>{
    [i=?X0]
  }
}

class FrameLock
declare ?X0
{
  <frame>{
    ?X0[lock]
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

class FrameTo
declare ?X0 ?PrepObj
{
  <frame>{
    ?X0[translocation,
      path:[path,
        trajectory: to,
        landmark: ?PrepObj]]
  };
  <iface>{
    [e=?X0]
  }
}

class FrameOver
declare ?X0 ?PrepObj
{
  <frame>{
    ?X0[translocation,
      path:[path,
        trajectory: over,
        landmark: ?PrepObj]]
  };
  <iface>{
    [e=?X0]
  }
}

class FrameFrom
declare ?X0 ?PrepObj
{
  <frame>{
    ?X0[translocation,
      path:[path,
        trajectory: from,
        landmark: ?PrepObj]]
  };
  <iface>{
    [e=?X0]
  }
}

class FrameInto
declare ?X0 ?PrepObj
{
  <frame>{
    ?X0[translocation,
      path:[path,
        trajectory: into,
        landmark: ?PrepObj]]
  };
  <iface>{
    [e=?X0]
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     EVALUATION                       %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

value FrameLaugh
value FrameDance
value FrameInsert
value FramePush
value FrameJump

value FrameTashtego
value FrameQueequeg
value FrameDaggoo

value FrameHorse
value FrameFence
value FrameKey
value FrameLock

value FrameDummy
value FrameTo
value FrameOver
value FrameFrom
value FrameInto