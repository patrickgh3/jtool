///nsp_execute_master(Start, End, Read-Only)
/*
Underlying NSP script.
*/
var nspListStr=global.nspListStr,
    nspListPar=global.nspListPar,
    nspToken=global.nspToken;
    
var i,list_min,list_max,spec_str,pri_b,read_only;

//*** PART 1: SETUP ***

list_min=argument0;
list_max=argument1;
read_only=argument2;

  //DEBUG:
  //show_message("MASTER: "+string(list_min)+", "+string(list_max)+", "+string(argument2)+" | "+list_string(nspListStr));

//*** PART 2: FORMAT ***

  //Nothing is needed here currently.

//*** PART 3: LOOKING FOR SPECIAL WORDS ***

if nspListStr[|list_min]="{"
 spec_str="{"
 
 else if nspListPar[|list_min]=NSP_TYPE._specword
  spec_str=nspListStr[|list_min];
  
  else spec_str="";
  
//*** PART 4: SWITCHING WITH SPECIAL WORD ***

switch (spec_str) begin

 case "{":
 var pos_1;
 
   pri_b=0;
   pos_1=-1;
   for (i=list_min+1; i<=list_max; i+=1) begin
   
    if nspListStr[|i]="{"
     pri_b+=1;
     else if nspListStr[|i]="}" {
      if pri_b=0 {
       pos_1=i;       
       break;
       }
       else pri_b-=1;
      }
    if (i=list_max and pos_1=-1) {
     NSP_notify("SCRIPT: nsp_execute_master. ERROR: Syntax error, execution aborted. ",nspListStr,list_min,list_max);
     exit;
     }

   end;

   nsp_execute_block(list_min+1,pos_1-1);
    
   //Remove executed part:
   if argument2=false {
    nsp_list_remove(list_min,pos_1);
    list_max-=(pos_1-list_min+1);
    }
    else list_min=pos_1+1;
   
  break;

 case "with":
   var a,b,pos_1,pos_2,pos_3;
   
   a=nsp_statement_positions(list_min+1,list_max,"With");
   
   if is_string(a) {
    NSP_notify("SCRIPT: nsp_execute_master. ERROR: Syntax error, execution aborted.",nspListStr,list_min,list_max);
    exit;
    }
    else {
     pos_1=a[0];
     pos_2=a[1];
     pos_3=a[2];
     a=0;
     }
       
   b=nsp_evaluate_list(pos_1+1,pos_2-1);
   if nsp_is_equal(b,nspToken[NSP_TOK.abort]) {
    NSP_notify("SCRIPT: nsp_execute_master. ERROR: Execution aborted because evaluation failed.",nspListStr,list_min,list_max);
    exit;
    }
   
   with (b) nsp_execute_master(pos_2+1,pos_3,true);
    
   //Remove executed part:
   if argument2=false {
    nsp_list_remove(list_min,pos_3);
    list_max-=(pos_3-list_min+1);
    }
    else list_min=pos_3+1;
   
  break;
  
 case "while":
   var a,b,pos_1,pos_2,pos_3;
   
   a=nsp_statement_positions(list_min+1,list_max,"While");
   
   if is_string(a) {
    NSP_notify("SCRIPT: nsp_execute_master. ERROR: Syntax error, execution aborted.",nspListStr,list_min,list_max);
    exit;
    }
    else {
     pos_1=a[0];
     pos_2=a[1];
     pos_3=a[2];
     a=0;
     }
       
   b=nsp_evaluate_list(pos_1+1,pos_2-1);
   if nsp_is_equal(b,nspToken[NSP_TOK.abort]) {
    NSP_notify("SCRIPT: nsp_execute_master. ERROR: Execution aborted because evaluation failed.",nspListStr,list_min,list_max);
    exit;
    }
     
   while (nsp_evaluate_list(pos_1+1,pos_2-1)=1) nsp_execute_master(pos_2+1,pos_3,true);
   
   //Remove executed part:
   if argument2=false {
    nsp_list_remove(list_min,pos_3);
    list_max-=(pos_3-list_min+1);   
    }
    else list_min=pos_3+1;
   
  break;
  
 case "repeat":
   var a,b,pos_1,pos_2,pos_3;
   
   a=nsp_statement_positions(list_min+1,list_max,"Repeat");
   
   if is_string(a) {
    NSP_notify("SCRIPT: nsp_execute_master. ERROR: Syntax error, execution aborted.",nspListStr,list_min,list_max);
    exit;
    }
    else {
     pos_1=a[0];
     pos_2=a[1];
     pos_3=a[2];
     a=0;
     }
     
   b=nsp_evaluate_list(pos_1+1,pos_2-1);
   if nsp_is_equal(b,nspToken[NSP_TOK.abort]) {
    NSP_notify("SCRIPT: nsp_execute_master. ERROR: Execution aborted because evaluation failed.",nspListStr,list_min,list_max);
    exit;
    }
       
   repeat (b) nsp_execute_master(pos_2+1,pos_3,true);
   
   //Remove executed part:
   if argument2=false {
    nsp_list_remove(list_min,pos_3);
    list_max-=(pos_3-list_min+1);   
    }
    else list_min=pos_3+1;
   
  break;
  
 case "if":
   var a,b,pos_1,pos_2,pos_3;
   
   a=nsp_statement_positions(list_min+1,list_max,"If");
   
   if is_string(a) {
    NSP_notify("SCRIPT: nsp_execute_master. ERROR: Syntax error, execution aborted.",nspListStr,list_min,list_max);
    exit;
    }
    else {
     pos_1=a[0];
     pos_2=a[1];
     pos_3=a[2];
     a=0;
     }
       
   b=nsp_evaluate_list(pos_1+1,pos_2-1);
   if nsp_is_equal(b,nspToken[NSP_TOK.abort]) {
    NSP_notify("SCRIPT: nsp_execute_master. ERROR: Execution aborted because evaluation failed.",nspListStr,list_min,list_max);
    exit;
    }
     
   if (b=1) nsp_execute_master(pos_2+1,pos_3,true);
   
   //Remove executed part:
   if argument2=false {
    nsp_list_remove(list_min,pos_3);
    list_max-=(pos_3-list_min+1);  
    }
    else list_min=pos_3+1;
    
  break;
  
 default:
   nsp_execute_line(list_min,list_max);
   
   //Remove executed part:
   if argument2=false {
    nsp_list_remove(list_min,list_max);
    list_max-=(list_max-list_min+1);
    }
    else list_min=list_max+1
   
  break;
  
end;

//*** PART 5: EXECUTE REMAINING CODE ***

  //DEBUG:
  //show_message("MASTER (Remaining): "+string(list_min)+", "+string(list_max)+", "+string(argument2)+" | "+list_string(nspListStr));

if list_max>=list_min
 nsp_execute_master(list_min,list_max,argument2);

