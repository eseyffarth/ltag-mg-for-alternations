% COMPILE WITH: synframe
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
% Third level of abstraction: Diathesis alternations       %
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

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Fourth level of abstraction: Constructions               %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class InstrumentAdjunct
import PrepositionalAdjunct[]
export ?InstrE
declare ?InstrE
{
  <syn>{
    node ?PP [cat=pp, e=?InstrE];
    node ?P [cat=p, e=?InstrE]
  };
  <frame>{
    ?InstrE[activity,
    instrument:?PrepObj]
  };
  <iface>{
    [e=?InstrE]
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

class InchoationConstruction
import IntransitiveDiathesis[]
{
  <syn>{
    node ?VP [cat=vp, e=?E]
  };
  <frame>{
    ?E[change_of_state,
       theme: ?X0,
       undergoer: ?X0]
  }
}
	
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

class LexicalCausation
import Causation[] TransitiveDiathesis[]
export ?Causation ?Cause ?Effect ?X0 ?X1
{
  <syn>{
    node ?VP [cat=vp, e=?E]
  };
  <iface>{
    [e=?E, e=?Causation]
  };
  <frame>{
    ?Causation[causation,
      undergoer: ?X1,
      cause:?Cause[undergoer: ?X1,
                  theme: ?X1]]
  }
}

class GeneralCausedChangeOfState
import Causation[] TransitiveDiathesis[]
export ?Causation ?Cause ?Effect ?X0 ?X1
{
  <syn>{
    node ?VP [cat=vp, e=?Causation];
    node ?V [cat=v, e=?Effect]
  };
  <frame>{
    ?Causation[
      undergoer: ?X1,
      cause: ?Cause[undergoer: ?X1,
                              theme: ?X1],
                effect: ?Effect[change_of_state,
                  undergoer: ?X1]]
  }
}

class AgentLexicalCausationConstruction
import LexicalCausation[]
{
  <frame>{
      ?Causation[causation,
        actor: ?X0,
        cause: ?Cause[transitive_action,
                  agent: ?X0
      ]]
  }
}

class AgentCausedChangeOfStateConstruction
import GeneralCausedChangeOfState[]
{
  <frame>{
    ?Causation[causation,
        actor: ?X0,
       cause: ?Cause[activity,
                 agent: ?X0
		 ]]
  }
}

class InstrumentLexicalCausationConstruction
import LexicalCausation[]
{
  <frame>{
    ?Causation[causation,
        actor: ?X0,
        cause: ?Cause[event,
                 instrument: ?X0[autonomous],
                 actor: ?X0]]
  }
}

class InstrumentCausedChangeOfStateConstruction
import GeneralCausedChangeOfState[]
{
  <frame>{
    ?Causation[causation,
       %actor: ?X0,
       cause: ?Cause[event,
                 instrument: ?X0[autonomous],
                 actor: ?X0]]
  }
}

class AgentCausation
{
  AgentLexicalCausationConstruction[]
  | AgentCausedChangeOfStateConstruction[]
}

class InstrumentCausation
{
  InstrumentLexicalCausationConstruction[]
  | InstrumentCausedChangeOfStateConstruction[]
}

class InstrumentWithConstructionCausative
import InstrumentAdjunct[]
declare ?VP1 ?VP2 ?SentenceE ?X
{
  <syn>{
    node ?VP1 [cat=vp, e=?SentenceE]{
      node ?VP2 (mark=foot) [cat=vp]
      node ?PP [cat=pp, e=?InstrE]
    }
  };
  <frame>{
    ?SentenceE[causation,
    cause:?InstrE[activity]]
  }
}

class InstrumentWithConstructionNoncausative
import InstrumentAdjunct[]
declare ?VP1 ?VP2 ?SentenceE ?X
{
  <syn>{
    node ?VP1 [cat=vp, e=?SentenceE]{
      node ?VP2 (mark=foot) [cat=vp]
      node ?PP [cat=pp, e=?InstrE]
    }
  };
  <iface>{
    [e=?InstrE, e=?SentenceE]
  };
  <frame>{
    ?InstrE[activity];
    ?SentenceE[]
  }
}

class InstrumentWithConstruction
{
  InstrumentWithConstructionCausative[] |
  InstrumentWithConstructionNoncausative[]
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fifth level of abstraction: Tree families                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class RegularIntransitiveVerbFamily
{
  IntransitiveActivityConstruction[]
  | InchoationConstruction[]
}

class RegularTransitiveVerbFamily
{
  TransitiveActivityConstruction[]
  | AgentCausation[]
  | InstrumentCausation[]
}

class RegularVerbFamily
{
  RegularIntransitiveVerbFamily[] | RegularTransitiveVerbFamily[]
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

% Diathesis alternations:
value IntransitiveDiathesis %
value TransitiveDiathesis %

% % Constructions:
value InstrumentAdjunct
value IntransitiveActivityConstruction %
value TransitiveActivityConstruction %
value InchoationConstruction %
value Causation %
value GeneralCausedChangeOfState %
value AgentCausation %
value InstrumentCausation %
value InstrumentWithConstruction

% Tree families:
value RegularIntransitiveVerbFamily
value RegularTransitiveVerbFamily
value RegularVerbFamily
