///nsp_evaluate_long(Grid, Nested call, [Optional] Start, [Optional] End)
/*
Underlying NSP script.
*/
var nspToken=global.nspToken;
var i,t,g,rv,list_min,list_max,pri_b;

//Setup:
if argument[1]=false
 g=argument[0]
 else {
  g=ds_grid_create(ds_grid_width(argument[0]),ds_grid_height(argument[0]));
  ds_grid_copy(g,argument[0]);
  }

if argument_count=2 {
 list_min=0;
 list_max=ds_grid_width(g)-1;
 }
 else {
  list_min=argument[2];
  list_max=argument[3]; 
  }
  
  //Debug:
  //show_message("LONG EVALUATOR: Min: "+string(list_min)+", Max: "+string(list_max)+" | "+grid_string_1d(g));

//1. If single, evaluate single ----------------------------------------------------------------------------%
if (list_min=list_max) {
 rv=nsp_evaluate_single(g[#list_min,0],g[#list_min,1]);
 ds_grid_destroy(g);
 return rv;
 }
 
//2. Find and execute all scripts: -------------------------------------------------------------------------%
i=list_min;
while (i<=list_max) begin

 if g[#i,1]=NSP_TYPE._script {
 
  //Find arguments:
  pri_b=0;
  var arg, counter = 0, pos_a = i+2;
      arg[0]=0;
  for (t=pos_a; t<=list_max; t+=1) {
  
   if g[#t,0]="(" pri_b+=1
    else if (g[#t,0]="," and pri_b=0) {
     arg[counter]=nsp_evaluate_long(g,true,pos_a,t-1);
     if nsp_is_equal(arg[counter],nspToken[NSP_TOK.abort]) {
      NSP_notify("SCRIPT: nsp_evaluate_long. ERROR: Script argument evaluation failed.");
      ds_grid_destroy(g);
      return nspToken[NSP_TOK.abort];
      }
     counter+=1;
     pos_a=t+1;
     }
     else if g[#t,0]=")" {      
      if pri_b>0 pri_b-=1
       else {
        //BREAK
        if t>i+2 {
         arg[counter]=nsp_evaluate_long(g,true,pos_a,t-1);
         if nsp_is_equal(arg[counter],nspToken[NSP_TOK.abort]) {
          NSP_notify("SCRIPT: nsp_evaluate_long. ERROR: Script argument evaluation failed.");
          ds_grid_destroy(g);
          return nspToken[NSP_TOK.abort];
          }
         counter+=1;
         }        

        break;
        }    
     }
  
  }
  
  if counter>0
   rv=nsp_execute_script(g[#i,0],arg)
   else
    rv=nsp_execute_script(g[#i,0],0);
   
  if nsp_is_equal(rv,nspToken[NSP_TOK.abort]) {
   NSP_notify("SCRIPT: nsp_evaluate_long. ERROR: Script execution failed.");
   ds_grid_destroy(g);
   return nspToken[NSP_TOK.abort];
   }
  //SQ:
  if is_string(rv) rv=nspToken[NSP_TOK.quote]+rv+nspToken[NSP_TOK.quote];
  
  // Special case - the script was the only thing to evaluate:
  if (i == list_min and t == list_max) {
    ds_grid_destroy(g);
    return rv;
    }
  // ***
  
  nsp_grid_shift(g,i+1,t);
  
  if is_real(rv)
    g[#i,1]=NSP_TYPE._number
    else if is_string(rv)
     g[#i,1]=NSP_TYPE._string
     else {
      NSP_notify("SCRIPT: nsp_evaluate_long. ERROR: Script returned incompatible value.");
      ds_grid_destroy(g);
      return nspToken[NSP_TOK.abort];     
      }
    
  g[#i,0]=nsp_string_force(rv);
  
  list_max-=(t-i);
  i+=1;
 
  }
  else i+=1;

end;

 //2.1 Check if it's single now:
 if (list_min=list_max) {
  rv=nsp_evaluate_single(g[#list_min,0],g[#list_min,1]);
  ds_grid_destroy(g);
  return rv;
  }

//3. Deal with complex local variables and DSM: ------------------------------------------------------------%
i=list_min+1;
while (i<=list_max) begin

 if g[#i,1]=NSP_TYPE._variablecl {
 
  var a,t,variable,target,min_pos;
 
  if g[#i-1,0]=")" {

   pri_b=0;
   min_pos=-1;
   for (t=i-2; t>=list_min; t-=1) {
    if g[#t,0]=")" pri_b+=1
     else if g[#t,0]="(" {
      if pri_b=0 {
       //BREAK
       min_pos=t;
       break;
       }
       else
        pri_b-=1;
      }
    if (t=list_min and min_pos=-1) {
     NSP_notify("SCRIPT: nsp_evaluate_long. ERROR: Could not fetch complex local variable.");
     ds_grid_destroy(g);
     return nspToken[NSP_TOK.abort];
     }
    }
   
   if (min_pos>list_min and g[#min_pos-1,1]=NSP_TYPE._script)
    min_pos-=1;
    
   target=nsp_evaluate_long(g,true,min_pos,i-1);
   variable=string_replace(g[#i,0],".","");
   
   }
   else if (g[#i-1,1]=NSP_TYPE._dsm) {
   
    target=nspToken[NSP_TOK.dsm_name];
    variable=string_replace(g[#i,0],".","");
    min_pos=i-1;
   
    }
    else {
    
     target=nsp_evaluate_single(g[#i-1,0],g[#i-1,1]);
     variable=string_replace(g[#i,0],".","");
     min_pos=i-1;
   
     }
    
  if nsp_is_equal(target,nspToken[NSP_TOK.abort]) or nsp_is_equal(variable,nspToken[NSP_TOK.abort]) {
   NSP_notify("SCRIPT: nsp_evaluate_long. ERROR: Could not fetch complex local variable.");
   ds_grid_destroy(g);
   return nspToken[NSP_TOK.abort];
   }
  
  if is_real(target) {
   a=nsp_variable_get_br(target,variable);
   }
   else {
    a=nsp_dsm_get(variable);
    }
 
  if nsp_is_equal(a,nspToken[NSP_TOK.abort]) {
   NSP_notify("SCRIPT: nsp_evaluate_long. ERROR: Could not fetch complex local variable.");
   ds_grid_destroy(g);
   return nspToken[NSP_TOK.abort];
   }
  
  nsp_grid_shift(g,min_pos+1,i);
  
  g[#min_pos,0]=nsp_string_force(a);
  
  if is_real(a)
   g[#min_pos,1]=NSP_TYPE._number
   else if is_string(a)
    g[#min_pos,1]=NSP_TYPE._string
    else {
     NSP_notify("SCRIPT: nsp_evaluate_long. ERROR: Incompatible value returned.");
     ds_grid_destroy(g);
     return nspToken[NSP_TOK.abort];     
     }
  
  list_max-=(i-min_pos);  
  i+=1;
   
  }
  else
   i+=1;

end;

 //3.1 Check if it's single now:
 if (list_min=list_max) {
  rv=nsp_evaluate_single(g[#list_min,0],g[#list_min,1]);
  ds_grid_destroy(g);
  return rv;
  }

//4. Deal with nested parenthesis: -------------------------------------------------------------------------%
i=list_max;
while (i>=list_min) begin

 if g[#i,0]="(" {
 
  var t,a,max_pos;
  
  max_pos=-1;
  for (t=i; t<=list_max; t+=1) {
  
   if g[#t,0]=")" {
    //BREAK
    max_pos=t;
    break;
    }
   
   if (t=list_max and max_pos=-1) {
    NSP_notify("SCRIPT: nsp_evaluate_long. ERROR: Can't find closed parenthesis.");
    ds_grid_destroy(g);
    return nspToken[NSP_TOK.abort]; 
    }
  
   }
   
  a=nsp_evaluate_long(g,true,i+1,t-1); 
  
  if nsp_is_equal(a,nspToken[NSP_TOK.abort]) {
   NSP_notify("SCRIPT: nsp_evaluate_long. Nested parenthesis evaluation failed.");
   ds_grid_destroy(g);
   return nspToken[NSP_TOK.abort];
   }
   
  nsp_grid_shift(g,i+1,t);
  
  if is_real(a)
    g[#i,1]=NSP_TYPE._number
    else if is_string(rv)
     g[#i,1]=NSP_TYPE._string
     else {
      NSP_notify("SCRIPT: nsp_evaluate_long. ERROR: Calculations returned incompatible value.");
      ds_grid_destroy(g);
      return nspToken[NSP_TOK.abort];     
      }
    
  g[#i,0]=nsp_string_force(a);
  
  list_max-=(t-i);
  i-=1;
 
  }
  else
   i-=1;

end;

 //4.1 Check if it's single now:
 if (list_min=list_max) {
  rv=nsp_evaluate_single(g[#list_min,0],g[#list_min,1]);
  ds_grid_destroy(g);
  return rv;
  }

//5. Deal with binary operations: --------------------------------------------------------------------------%
var a,token,val_l,val_r;

//Math (division, div, modulo, multiply, power):
i=list_min;
while (i<list_max) {

 if g[#i,1]=NSP_TYPE._operator {
 
  if (   g[#i,0]=nspToken[NSP_TOK.multiply]
      or g[#i,0]=nspToken[NSP_TOK.divide]
      or g[#i,0]=nspToken[NSP_TOK._div]
      or g[#i,0]=nspToken[NSP_TOK._mod]
      or g[#i,0]=nspToken[NSP_TOK._power]  ) {
      
   token=g[#i,0];
   val_r=nsp_evaluate_single(g[#i+1,0],g[#i+1,1]);
   val_l=nsp_evaluate_single(g[#i-1,0],g[#i-1,1]);
   
   if nsp_is_equal(val_l,nspToken[NSP_TOK.abort]) or nsp_is_equal(val_r,nspToken[NSP_TOK.abort]) {
    NSP_notify("SCRIPT: nsp_evaluate_long. ERROR: Calculations failed.");
    ds_grid_destroy(g);
    return nspToken[NSP_TOK.abort];    
    }
   
   a=nsp_arithmetic_calculate(val_l,val_r,token);
   
   nsp_grid_shift(g,i,i+1);
   list_max-=2;
   
   g[#i-1,0]=a;
   g[#i-1,1]=NSP_TYPE._number; 
   
   i-=1;
   
   }
 
  }
  
 i+=1;

 }
 
//Math (add, subtract):
i=list_min;

//DEBUG:
//show_message("Grid before addition:" + grid_string_1d(g) +
//"##>>list_min = " + string(list_min) + ", list_max = " + string(list_max) + ", i = " + string(i));

while (i<list_max) {

 if g[#i,1]=NSP_TYPE._operator {
 
  if (   g[#i,0]=nspToken[NSP_TOK.add]
      or g[#i,0]=nspToken[NSP_TOK.subtract]) {
      
   token=g[#i,0];
   val_r=nsp_evaluate_single(g[#i+1,0],g[#i+1,1]);
   val_l=nsp_evaluate_single(g[#i-1,0],g[#i-1,1]);
   
   //DEBUG:
   //show_message("val_l: "+nsp_string_force(val_l)+", isString: "+string(is_string(val_l)));
   //show_message("val_r: "+nsp_string_force(val_r)+", isString: "+string(is_string(val_r)));
   
   if nsp_is_equal(val_l,nspToken[NSP_TOK.abort]) or nsp_is_equal(val_r,nspToken[NSP_TOK.abort]) {
    NSP_notify("SCRIPT: nsp_evaluate_long. ERROR: Calculations failed.");
    ds_grid_destroy(g);
    return nspToken[NSP_TOK.abort];    
    }
   
   a=nsp_arithmetic_calculate(val_l,val_r,token); 
   
   nsp_grid_shift(g,i,i+1);
   list_max-=2;
   
   g[#i-1,0]=a;
   
   if nsp_is_number(a)
    g[#i-1,1]=NSP_TYPE._number
    else
     g[#i-1,1]=NSP_TYPE._string;
     
   i-=1;
   
   //DEBUG:
   //show_message("Grid after addition:" + grid_string_1d(g) +
   //"##>>list_min = " + string(list_min) + ", list_max = " + string(list_max) + ", i = " + string(i));
   
   }
 
  }
  
 i+=1;

 }

//Comparisons (equal, larger, larger_equal, smaller, smaller_equal, unequal):
i=list_min;
while (i<list_max) {

 if g[#i,1]=NSP_TYPE._operator {
 
  if (   g[#i,0]=nspToken[NSP_TOK.equal]
      or g[#i,0]=nspToken[NSP_TOK.larger]
      or g[#i,0]=nspToken[NSP_TOK.larger_equal]
      or g[#i,0]=nspToken[NSP_TOK.smaller]
      or g[#i,0]=nspToken[NSP_TOK.smaller_equal]
      or g[#i,0]=nspToken[NSP_TOK.unequal]  ) {
      
   token=g[#i,0];
   val_r=nsp_evaluate_single(g[#i+1,0],g[#i+1,1]);
   val_l=nsp_evaluate_single(g[#i-1,0],g[#i-1,1]);
   
   if nsp_is_equal(val_l,nspToken[NSP_TOK.abort]) or nsp_is_equal(val_r,nspToken[NSP_TOK.abort]) {
    NSP_notify("SCRIPT: nsp_evaluate_long. ERROR: Calculations failed.");
    ds_grid_destroy(g);
    return nspToken[NSP_TOK.abort];    
    }
   
   a=nsp_comparison_calculate(val_l,val_r,token);
   
   nsp_grid_shift(g,i,i+1);
   list_max-=2;
   
   g[#i-1,0]=a;
   g[#i-1,1]=NSP_TYPE._number; 
   
   i-=1;
   
   }
 
  }
  
 i+=1;

 }

//Combinations (and, or, xor):
i=list_min;
while (i<list_max) {

 if g[#i,1]=NSP_TYPE._operator {
 
  if (   g[#i,0]=nspToken[NSP_TOK._and]
      or g[#i,0]=nspToken[NSP_TOK._or]
      or g[#i,0]=nspToken[NSP_TOK._xor]  ) {
      
   token=g[#i,0];
   val_r=nsp_evaluate_single(g[#i+1,0],g[#i+1,1]);
   val_l=nsp_evaluate_single(g[#i-1,0],g[#i-1,1]);
   
   if nsp_is_equal(val_l,nspToken[NSP_TOK.abort]) or nsp_is_equal(val_r,nspToken[NSP_TOK.abort]) {
    NSP_notify("SCRIPT: nsp_evaluate_long. ERROR: Calculations failed.");
    ds_grid_destroy(g);
    return nspToken[NSP_TOK.abort];    
    }
   
   a=nsp_combination_calculate(val_l,val_r,token);
   
   nsp_grid_shift(g,i,i+1);
   list_max-=2;
   
   g[#i-1,0]=a;
   g[#i-1,1]=NSP_TYPE._number; 
   
   i-=1;
   
   }
 
  }
  
 i+=1;

 }

 //5.1 Check if it's single now:
 if (list_min=list_max) {
  rv=nsp_evaluate_single(g[#list_min,0],g[#list_min,1]);
  ds_grid_destroy(g);
  return rv;
  }
  
//6. Remove grid and report failure: -----------------------------------------------------------------------%
NSP_notify("SCRIPT: nsp_evaluate_long. ERROR: Evaluation failed - unknown format.");
ds_grid_destroy(g);
return nspToken[NSP_TOK.abort];
