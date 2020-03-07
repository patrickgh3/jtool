///nsp_execute_single(Start, End, StrList, ParList)
/*
Underlying NSP script.
*/
var nspListStr = argument2,
    nspListPar = argument3,
    nspToken=global.nspToken;
var i,av,list_min,list_max,pos,op_char,as_var_max,exec_code_min;

list_min=argument0;
list_max=argument1;

if nspListStr[|list_max]=";"
 list_max-=1;
 
//***Search for assignment token etc:
pos=-1;
for (i=list_min; i<=list_max; i+=1) begin
 if nspListStr[|i]=nspToken[NSP_TOK.assign] {
   pos=i;
   break;}
 end;

if pos<>-1 {
 //Operator char:
 op_char=nspListStr[|pos-1];
 
 if op_char=nspToken[NSP_TOK.add]
  op_char="+"
  else if op_char=nspToken[NSP_TOK.subtract]
   op_char="-"
     else if op_char=nspToken[NSP_TOK.multiply]
      op_char="*"
      else if op_char=nspToken[NSP_TOK.divide]
       op_char="/"
       else
        op_char="";
 
 //Assign Variable:
 if op_char=""
  as_var_max=pos-1
  else
   as_var_max=pos-2;
   
 //Code to execute:
 exec_code_min=pos+1;
 
 }
 else {
  op_char="";
  as_var_max=-1;
  exec_code_min=list_min;
  }    
  
//***Evaluate code:
av=nsp_evaluate_list(exec_code_min, list_max, nspListStr, nspListPar);
if nsp_is_equal(av,nspToken[NSP_TOK.abort]) {
 NSP_notify("SCRIPT: nsp_execute_single. ERROR: Aborting because evaluation failed.",nspListStr,list_min,list_max);
 return nspToken[NSP_TOK.abort];
 }
  
//***Assign value:
if as_var_max<>-1 {
 
 var mode,varname,target;
   
 switch (nspListPar[|as_var_max]) begin
  
  case NSP_TYPE._variablesl:
    varname=nspListStr[|as_var_max];
    target=id;    
    mode=0;
   break;
    
  case NSP_TYPE._variablecl:
    varname=string_replace(nspListStr[|as_var_max],".","");
    
    //Check if it's DSM:
    if (list_min=as_var_max-1 and nspListStr[|list_min]=nspToken[NSP_TOK.dsm_name]) {
     mode=3;
     }
     else {
      target=nsp_evaluate_list(list_min, as_var_max-1, nspListStr, nspListPar);
    
      if nsp_is_equal(target,nspToken[NSP_TOK.abort]) {
       NSP_notify("SCRIPT: nsp_execute_single. ERROR: Cannot assign value because target could not be evaluated.",nspListStr,list_min,list_max);
       exit;
       }
     
      mode=1;
      }
   break;
    
  case NSP_TYPE._variablegl:
    varname=nspListStr[|as_var_max];
    target=-1;
    mode=2;
   break;
    
  default:
    NSP_notify("SCRIPT: nsp_execute_single. ERROR: Cannot assign value - illegal target.",nspListStr,list_min,list_max);
    exit;
   break;  
  
 end;
   
 //Find current value if needed:
 if op_char<>"" {
 
  var old_val;
 
  if mode<=1 {
  
    old_val=nsp_variable_get_br(target,varname);
    if nsp_is_equal(old_val,nspToken[NSP_TOK.abort]) {
     exit;
     }
    //SQ
    if is_string(old_val) old_val=nspToken[NSP_TOK.quote]+old_val+nspToken[NSP_TOK.quote];
    
    }
    else if mode=2 {
    
     old_val=nsp_variable_global_get_br(varname);
     if nsp_is_equal(old_val,nspToken[NSP_TOK.abort]) {
      exit;
      }
     //SQ
     if is_string(old_val) old_val=nspToken[NSP_TOK.quote]+old_val+nspToken[NSP_TOK.quote];
     
     }
     else if mode=3 {
     
      old_val=nsp_dsm_get(varname);
      if nsp_is_equal(old_val,nspToken[NSP_TOK.abort]) {
       exit;
       }
      //SQ
      if is_string(old_val) old_val=nspToken[NSP_TOK.quote]+old_val+nspToken[NSP_TOK.quote];
      
      }
  }
  
 //Switch using operator char (calcualted above): 
 switch (op_char) begin
  
  case "+":
   
    if is_real(old_val)
     av=real(nsp_arithmetic_calculate(old_val,av,nspToken[NSP_TOK.add]))
     else av=nsp_arithmetic_calculate(old_val,av,nspToken[NSP_TOK.add]);
  
    if mode<=1 {
     nsp_variable_set_br(target,varname,av);
     }
     else if mode=2 {
      nsp_variable_global_set_br(varname,av);
      }
      else if mode=3 {
       nsp_dsm_set(varname,av);
       }
    
   break;
   
  case "-":
    if mode<=1 {
     nsp_variable_set_br(target,varname,old_val-av);
     }
     else if mode=2 {
      nsp_variable_global_set_br(varname,old_val-av);
      }
      else if mode=3 {
       nsp_dsm_set(varname,old_val-av);
       }
   break;
    
  case "*":
    if mode<=1 {
     nsp_variable_set_br(target,varname,old_val*av);
     }
     else if mode=2 {
      nsp_variable_global_set_br(varname,old_val*av);
      }
      else if mode=3 {
       nsp_dsm_set(varname,old_val*av);
       }
   break; 
 
  case "/":
    if mode<=1 {
     nsp_variable_set_br(target,varname,old_val/av);
     }
     else if mode=2 {
      nsp_variable_global_set_br(varname,old_val/av);
      }
      else if mode=3 {
       nsp_dsm_set(varname,old_val/av);
       }
   break;
   
  default:
    if mode<=1 {
     nsp_variable_set_br(target,varname,av);
     }
     else if mode=2 {
      nsp_variable_global_set_br(varname,av);
      }
      else if mode=3 {
       nsp_dsm_set(varname,av);
       }
   break;
   
 end;
  
 }
