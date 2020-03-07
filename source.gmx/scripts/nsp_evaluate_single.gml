///nsp_evaluate_single(String, Type)
/*
Underlying NSP script.
*/
var nspToken=global.nspToken;
var work_str,rv;

work_str=argument0;

switch (argument1) begin

 //Real:
 case NSP_TYPE._number:
   return real(work_str);
  break;

 //String:
 case NSP_TYPE._string:
   return work_str;
  break;
 
 //Asset:
 case NSP_TYPE._asset:
   return asset_get_index(work_str);
  break;
  
 //DSM:
 case NSP_TYPE._dsm:
   var variable;
   if nspToken[NSP_TOK.dsm_allowed]=1 {
    variable=string_delete(work_str,1,string_length(nspToken[NSP_TOK.dsm_name])+1);
    rv=nsp_dsm_get(variable);
      
    if nsp_is_equal(rv,nspToken[NSP_TOK.abort]) {
     NSP_notify("SCRIPT: nsp_evaluate_single. ERROR: Cannot get DSM value ("+argument0+").");
     return nspToken[NSP_TOK.abort];
     }
    //SQ:
    if is_string(rv) rv=nspToken[NSP_TOK.quote]+rv+nspToken[NSP_TOK.quote];
    return rv;
  }
  else {
   NSP_notify("SCRIPT: nsp_evaluate_single. ERROR: DSM not allowed!");
    return nspToken[NSP_TOK.abort];   
   }
  break;
  
 //Special word:
 case NSP_TYPE._specword:
   return nsp_evaluate_special_word(work_str);
  break;   
  
 //Variable (SL):
 case NSP_TYPE._variablesl:
   rv=nsp_variable_get_br(id,work_str);
   if nsp_is_equal(rv,nspToken[NSP_TOK.abort]) {
    NSP_notify("SCRIPT: nsp_evaluate_single. ERROR: Cannot get the variable ("+work_str+").");
    return nspToken[NSP_TOK.abort];
    }
   //SQ:
   if is_string(rv) rv=nspToken[NSP_TOK.quote]+rv+nspToken[NSP_TOK.quote];
   return rv;
  break;
  
 //Variable (GL):
 case NSP_TYPE._variablegl:
   rv=nsp_variable_global_get_br(work_str);
   if nsp_is_equal(rv,nspToken[NSP_TOK.abort]) {
    NSP_notify("SCRIPT: nsp_evaluate_single. ERROR: Cannot get the variable ("+work_str+").");
    return nspToken[NSP_TOK.abort];
    }
   //SQ:
   if is_string(rv) rv=nspToken[NSP_TOK.quote]+rv+nspToken[NSP_TOK.quote];
   return rv;
  break; 
  
 default:
   NSP_notify("SCRIPT: nsp_evaluate_single. ERROR: Cannot identify the string ("+work_str+").");
   return nspToken[NSP_TOK.abort];
  break;

end;
