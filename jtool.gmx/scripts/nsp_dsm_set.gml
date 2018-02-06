///nsp_dsm_set(Name, Value)
/*
Underlying NSP script.
*/
var nspToken=global.nspToken;

if is_string(argument1) {
 if nsp_is_string(argument1)
  argument1=string_copy(argument1,2,string_length(argument1)-2);
 }

if nspToken[NSP_TOK.dsm_allowed]=1
&& ds_exists(global.nspDsMap,ds_type_map) {
 ds_map_delete(global.nspDsMap,argument0);
 ds_map_add(global.nspDsMap,argument0,argument1);
 }
 else {
  NSP_notify("SCRIPT: nsp_dsm_set. ERROR: DSM does not exist.");
  exit;
  }

