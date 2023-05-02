%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Syntactic information for the CMC/IAA TAG fragment       %
% COMPILE WITH: synframe                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file contains the syntactic trees of our grammar    %
% and connects them to their frames. Individual slots of   %
% these frames will be filled with frames from the frame   %
% lexicon (frame_dimension.mg), according to the tokens    %
% that are being parsed.                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

type MARK = {subst, nadj, anchor, coanchor, lex, foot}
type CAT = {n, np, v, vp, s, pp, p, d, det}
type LABEL !
type LABEL_I !
type LABEL_E !

property mark : MARK

% Syntactic Features
feature cat : CAT

% Interface Features
feature i : LABEL_I
feature e : LABEL_E

include type_hierarchy.mg


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First level of abstraction: Tree fragments               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class Propernoun
declare ?NP ?N ?X0
{
  <syn>{
    node ?NP (mark=nadj) [cat=np, i=?X0] {
      node ?N (mark=anchor) [cat=n, i=?X0] 
    }
  };
  <iface>{
    [i=?X0]
  }
}

class Commonnoun
declare ?NP ?N ?X0
{
  <syn>{
    node ?NP [cat=np, i=?X0] {
      node ?N (mark=anchor) [cat=n, i=?X0]
    }
  };
  <iface>{
    [i=?X0]
  }
}

class Determiner
declare ?NP1 ?NP2 ?Det
{<syn>{
    node ?NP1 [cat=np] {
      node ?Det (mark=anchor) [cat=det]
      node ?NP2 (mark=foot) [cat=np]
    }
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second level of abstraction: Grammatical functions       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class Subject
export ?NP ?X0
declare ?NP ?X0
{
  <syn>{
    node ?NP (mark=subst) [cat=np, i=?X0]
  }
}

class Object
export ?X1 ?VP ?ObjNP
declare ?X1 ?VP ?ObjNP
{ 
  <syn>{
    node ?VP [cat=vp];
    node ?ObjNP (mark=subst)[cat=np, i=?X1];
    ?VP ->+ ?ObjNP
  }
}

class MainVerb
export ?VP ?V ?E
declare ?VP ?V ?E
{
  <syn> {
    node ?VP [cat=vp]{
		  node ?V (mark=anchor) [cat=v, e=?E]
	  }
  };
  <iface>{
    [e=?E]
  }
}

class PrepositionalAdjunct
export ?PP ?P ?PrepObj
declare ?PP ?P ?NP ?PrepObj
{
  <syn>{
    node ?PP [cat=pp] {
      node ?P (mark=anchor) [cat=p]
      node ?NP (mark=subst) [cat=np, i=?PrepObj]
    }
  }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Third level of abstraction: Diathesis alternatives       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class IntransitiveDiathesis
import Subject[] MainVerb[]
export ?S ?VP
declare ?S
{
  <syn>{
    node ?S [cat=s];
    ?S -> ?NP;
    ?S ->+ ?VP;
    ?NP >>+ ?VP
  }
}

class TransitiveDiathesis
import IntransitiveDiathesis[] Object[]
{
  <syn>{
    ?V >>+ ?ObjNP
  }
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fourth level of abstraction: Constructions               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class DirectionalAdjunct
import PrepositionalAdjunct[]
export ?Path ?PP
declare ?Path ?E
{
  <syn>{
    node ?PP [cat=pp, e=?E];
    node ?P [cat=p, e=?E]
  };
  <frame>{
    ?E[translocation,
      path:[path,
      landmark:?PrepObj]]
  };
  <iface>{
    [e=?E]
  }
}

class IntransitiveActivityConstruction
import IntransitiveDiathesis[]
{
  <syn>{
    node ?VP [cat=vp, e=?E]
  };
  <frame>{
    ?E[activity,
       agent:?X0]
  }
}

class TransitiveActivityConstruction
import TransitiveDiathesis[]
{
  <syn>{
    node ?VP [cat=vp, e=?E]
  };
  <frame> {
    ?E[activity,
       agent: ?X0,
       theme: ?X1,
       undergoer: ?X1]
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class Causation
export ?Effect ?Cause ?Causation
declare ?Effect ?Cause ?Causation
{
  <frame>{
    ?Causation[causation,
       cause: ?Cause,
       effect: ?Effect]
  }
}

class LexicalCausationConstruction
import Causation[] TransitiveDiathesis[]
export ?Causation ?Cause ?Effect ?X0 ?X1
{
  <syn>{
    node ?VP [cat=vp, e=?Causation]
  };
  <iface>{
    [e=?E, e=?Causation]
  };
  <frame>{
    ?Causation[causation,
      cause:?Cause[transitive_action,
            actor: ?X0,
            undergoer: ?X1,
            theme: ?X1]]
  }
}

class InducedActionConstruction
import TransitiveDiathesis[] Causation[]
{
  <syn>{
    node ?VP [cat=vp, e=?Causation];
    node ?V (mark=anchor) [cat=v, e=?Effect]
  };
  <frame>{
    ?Causation[causation,
      actor: ?X0,
      undergoer: ?X1,
       cause: [transitive_action,
               agent: ?X0,
               undergoer: ?X1,
               theme: ?X1],
       effect: ?Effect[translocation & agentive_manner_of_motion,
                  agent: ?X1[animate],
                  mover: ?X1,
                  path: [path]]]
  };
  <iface>{
    [e=?Effect]
  }
}

class GeneralCausedMotion
import Causation[] DirectionalAdjunct[]
export ?VPCausation1 ?VPCausation2 ?Causation ?PP
declare ?VPCausation1 ?VPCausation2
{
  <syn>{
    node ?VPCausation1 [cat=vp, e=?Cause];
    node ?VPCausation2 (mark=foot) [cat=vp,e=?Cause];
    ?VPCausation1 ->+ ?VPCausation2;
    ?VPCausation1 -> ?PP;
    ?VPCausation2 >>+ ?PP;
    node ?PP [cat=pp, e=?Effect]
  };
  <frame>{
    ?Causation[causation,
        cause:?Cause,
        effect:?Effect[translocation,
              path:?Path]]
  }
}

class PrepositionalCausedMotionConstruction
import GeneralCausedMotion[]
declare ?X1
{
  <frame>{
    ?Causation[causation,
        undergoer: ?X1,
        cause:?Cause[transitive_action,
          undergoer: ?X1,
          theme: ?X1],
        effect:?Effect[
              mover:?X1,
              undergoer: ?X1
        ]]
  }
}

class PrepositionalCausedMotionConstructionAddingConstructionalObject
import Object[] GeneralCausedMotion[]
{
  <syn>{
    ?VP = ?VPCausation1;
    ?VPCausation1 -> ?VPCausation2;
    ?VPCausation1 -> ?ObjNP;
    ?VPCausation2 >> ?ObjNP;
    node ?PP [cat=pp,e=?Effect];
    ?VPCausation1 -> ?PP;
    ?VPCausation2 >>+ ?PP
  };
  <frame>{
    ?Causation[causation,
        undergoer: ?X1,
        cause:?Cause[intransitive_action],
        effect:?Effect[translocation, 
                      mover:?X1,
                      undergoer: ?X1]]
  }
}

class DirectedMotionAddingCausationAndPath
{
  PrepositionalCausedMotionConstruction[] 
  | PrepositionalCausedMotionConstructionAddingConstructionalObject[]
}

class LocomotionConstruction
import DirectionalAdjunct[]
declare ?VP1 ?VP2 ?E ?X0
{
  <syn>{
    node ?VP1 [cat=vp,e=?E];
    node ?VP2 (mark=foot) [cat=vp,e=?E];
    ?VP1 ->+ ?VP2;
    ?VP1 ->+ ?PP;
    ?VP2 >>+ ?PP;
    % TODO optional?
    node ?PP [cat=pp, e=?E]
  };
  <frame>{
    ?E[translocation,
        agent:?X0,%[animate],
        mover:?X0,
        path:?Path]
  }
}

class CausedTranslocationConstruction
import DirectionalAdjunct[]
declare ?VP1 ?VP2 ?E ?X0 ?Effect
{
  <syn>{
    node ?VP1 [cat=vp,e=?E];
    node ?VP2 (mark=foot) [cat=vp,e=?E];
    ?VP1 ->+ ?VP2;
    ?VP1 ->+ ?PP;
    ?VP2 >>+ ?PP;
    node ?PP [cat=pp, e=?Effect]
  };
  <frame>{
    ?E[causation,
      undergoer: ?X0,
      effect:?Effect[translocation,
        mover:?X0,
        path:?Path]]
  }
}

class DirectedMotionAddingPath
{
  LocomotionConstruction[]
  | CausedTranslocationConstruction[]
}

class DirectedMotion
{
  DirectedMotionAddingCausationAndPath[]
  | DirectedMotionAddingPath[]
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fifth level of abstraction: Tree families                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class RegularIntransitiveVerbFamily
{
  InducedActionConstruction[] |
  IntransitiveActivityConstruction[]
}

class RegularTransitiveVerbFamily
{
  TransitiveActivityConstruction[]
  | LexicalCausationConstruction[]
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     EVALUATION                       %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Fragments:
value Propernoun
value Commonnoun
value Determiner

% Grammatical functions:
value Subject %
value Object %
value MainVerb %
value PrepositionalAdjunct %

% Diathesis alternatives:
value IntransitiveDiathesis %
value TransitiveDiathesis %

% % Constructions:
value InducedActionConstruction %
value DirectionalAdjunct %
value IntransitiveActivityConstruction %
value TransitiveActivityConstruction % 
value CausedTranslocationConstruction %
value LexicalCausationConstruction %
value DirectedMotionAddingPath %
value DirectedMotionAddingCausationAndPath %
value DirectedMotion
value LocomotionConstruction
value GeneralCausedMotion %
value Causation
value PrepositionalCausedMotionConstructionAddingConstructionalObject
value PrepositionalCausedMotionConstruction

% Tree families:
value RegularIntransitiveVerbFamily
value RegularTransitiveVerbFamily