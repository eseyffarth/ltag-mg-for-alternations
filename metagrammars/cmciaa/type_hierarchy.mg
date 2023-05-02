%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRAME HIERARCHY for the CMC/IAA TAG fragment             %
% This file is included in the syn dimension and the frame %
% dimension. It is compiled with the synframe compiler     %
% using the --more flag.                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

frame-types = {
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Event types:
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  event,
  simple_event, complex_event,
  activity, 
  intransitive_action, transitive_action,
  causation,

  agentive_manner_of_motion,
  translocation,
  laughing, dancing, pushing, jumping, inserting,
    
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Entity types:
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  entity,
  animate, inanimate, physical_object, 
  person, 
  
  animal, horse, fence, key, lock,
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Path types:
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  path
  }

frame-constraints = {

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Subtype relations and incompatibilities:
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  event entity -> -,
  
  simple_event -> event,
  complex_event -> event,
  simple_event complex_event -> -,
  
  activity -> simple_event,

  causation -> complex_event,
  
  intransitive_action -> activity,
  transitive_action -> activity,
  intransitive_action transitive_action -> -,

  activity -> actor:entity,

  agent:+ -> agent=actor,
  agent:+ -> agent:animate,
  activity -> agent=actor,     

  cause.actor:+ -> cause.actor=actor,
  effect.undergoer:+ -> effect.undergoer=undergoer,

  animate -> entity,
  person -> animate,
  inanimate -> entity,
  physical_object -> inanimate,
  animate inanimate -> -,

  animal -> animate,
  animal person -> -, 

  %%%

  path event -> -,
  path entity -> -,

  translocation -> simple_event,
  translocation transitive_action -> -,

  agentive_manner_of_motion -> intransitive_action,

  laughing -> intransitive_action,
  jumping -> intransitive_action,
  dancing -> intransitive_action,
  inserting -> causation,
  pushing -> transitive_action,

  laughing dancing -> -,
  laughing jumping -> -,
  jumping dancing -> -,

  laughing agentive_manner_of_motion -> -, 
  laughing translocation -> -,

  laughing transitive_action -> -,
  jumping transitive_action -> -,
  dancing transitive_action -> -,
  pushing intransitive_action -> -,

  horse -> animal,

  fence -> physical_object,  
  key -> physical_object, 
  lock -> physical_object, 

  fence key -> -,
  lock key -> -,
  fence lock -> -,

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Attribute constraints:
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  inserting -> cause:transitive_action,
  inserting -> effect:translocation

  }