%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FRAME HIERARCHY for the CIA/ISA TAG fragment             %
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
  
  change_of_state, 
  eating, slicing, becoming_broken, becoming_empty,

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Entity types:
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  entity,
  animate, inanimate, physical_object,
  person, 

  inedible, edible,
  solid, sharp_object, autonomous, container,
  bucket, pump, soup, coconut, window, machete, hammer, 
  spoon,
  can_move_substances, can_manipulate_food,

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % State types:
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  state,
  being_sliced, being_broken, being_empty
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

  %%%

  state event -> -,
  state entity -> -,

  change_of_state -> simple_event,
  change_of_state activity -> -,

  being_sliced -> state,
  being_broken -> state,
  being_empty -> state,

  being_sliced being_broken -> -,
  being_sliced being_empty -> -,
  being_broken being_empty -> -,

  inedible -> physical_object,
  edible -> physical_object,
  inedible edible -> -,

  solid -> physical_object,
  autonomous -> inedible,

  can_move_substances -> inedible,
  can_manipulate_food -> inedible,

  eating -> transitive_action,
  becoming_broken -> change_of_state,
  becoming_empty -> change_of_state,
  slicing -> causation,

  container sharp_object -> -,  
  
  eating -> transitive_action,
  becoming_broken -> change_of_state,
  becoming_empty -> change_of_state,
  slicing -> causation,

  becoming_broken becoming_empty -> -,

  soup -> edible,
  soup solid -> -,
  container -> inedible,
  sharp_object -> inedible, 
  bucket -> container,
  window -> inedible,
  coconut -> edible,
  pump -> inedible,
  spoon -> inedible,
  hammer -> inedible,
  machete -> sharp_object,

  bucket machete -> -,
  bucket coconut -> -,
  bucket hammer -> -,
  bucket window -> -,
  bucket spoon -> -,
  pump machete -> -,
  pump coconut -> -,
  pump hammer -> -,
  pump window -> -,
  pump spoon -> -,
  machete coconut -> -,
  machete hammer -> -,
  machete window -> -,
  machete spoon -> -,
  coconut hammer -> -,
  coconut window -> -,
  coconut spoon -> -,
  hammer window -> -,
  hammer spoon -> -,
  window spoon -> -,
 
  container hammer -> -,
  container window -> -,
  container spoon -> -,
  container machete -> -,
  container pump -> -,

  window sharp_object -> -,
  coconut sharp_object -> -,
  pump sharp_object -> -,
  spoon sharp_object -> -,
  hammer sharp_object -> -,

  container autonomous -> -,
  coconut autonomous -> -,
  window autonomous -> -,
  spoon autonomous -> -,

  machete can_move_substances -> -,
  coconut can_move_substances -> -,
  hammer can_move_substances -> -,
  window can_move_substances -> -,

  bucket can_manipulate_food -> -,
  coconut can_manipulate_food -> -,
  hammer can_manipulate_food -> -,
  window can_manipulate_food -> -,
  pump can_manipulate_food -> -,

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Attribute constraints:
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  causation -> cause:event,
  causation -> effect:event,

  eating -> agent:animate, 
  eating -> theme:edible,
  eating.instrument:+ -> instrument:can_manipulate_food,

  becoming_empty -> undergoer:container,
  effect:becoming_empty -> cause.instrument:can_move_substances,
  
  becoming_broken -> undergoer:solid,
  effect:becoming_broken -> cause.instrument:solid,

  slicing -> cause.undergoer:solid,
  slicing -> cause.instrument:sharp_object
}