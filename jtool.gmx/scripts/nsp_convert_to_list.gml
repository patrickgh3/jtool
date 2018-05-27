///nsp_convert_to_list(String, Target List)
/*
Underlying NSP script.
*/
var i,work_str,pri_q,token,tokenArray,list;
var copy_1,copy_2,copy_3;

//Setup:
work_str=argument0;
list=argument1;

tokenArray=global.nspToken;

work_str=nsp_string_crop(work_str);

//Enter the loop:
while string_length(work_str)>0 {

 pri_q=1;
 token="";
 
 for (i=1; i<=string_length(work_str); i+=1) begin
 
  copy_1=string_copy(work_str,i,1);
  copy_2=string_copy(work_str,i,2);
  copy_3=string_copy(work_str,i,3);
 
  if string_copy(work_str,i,1)=tokenArray[NSP_TOK.quote]
   pri_q*=-1;
   
  //Check for tokens:
  if pri_q=1 {
  
   //Whitespace:
   if (copy_1)=" " {
    if i<>1 {
      ds_list_add(list,string_copy(work_str,1,i-1));
      work_str=string_delete(work_str,1,i);
      break;
      }    
    
    }  
   //Complex locals:
    else if (copy_1=".") {
     if i<>1 and string_digits(string_copy(work_str,i+1,1))<>string_copy(work_str,i+1,1) {
      ds_list_add(list,string_copy(work_str,1,i-1));
      work_str=string_delete(work_str,1,i-1);
      break;
      }
      
     }
    //Default tokens:
     else if (   copy_1="{"
              or copy_1="}"
              or copy_1="("
              or copy_1=")"
              or copy_1=";"
              or copy_1=","   ) {
               
      token=copy_1;

      if i<>1 ds_list_add(list,string_copy(work_str,1,i-1));
      ds_list_add(list,token);
      work_str=string_delete(work_str,1,i);
      break; 
                          
      }           
     //Tokens of length 3:
     else if (   copy_3=tokenArray[NSP_TOK.multiply]
              or copy_3=tokenArray[NSP_TOK.divide]
              or copy_3=tokenArray[NSP_TOK._div]
              or copy_3=tokenArray[NSP_TOK._mod]
              or copy_3=tokenArray[NSP_TOK._power]
              or copy_3=tokenArray[NSP_TOK.add]
              or copy_3=tokenArray[NSP_TOK.subtract]
              or copy_3=tokenArray[NSP_TOK.equal]
              or copy_3=tokenArray[NSP_TOK.larger]
              or copy_3=tokenArray[NSP_TOK.larger_equal]
              or copy_3=tokenArray[NSP_TOK.smaller]
              or copy_3=tokenArray[NSP_TOK.smaller_equal]
              or copy_3=tokenArray[NSP_TOK.unequal]
              or copy_3=tokenArray[NSP_TOK._and]
              or copy_3=tokenArray[NSP_TOK._or]
              or copy_3=tokenArray[NSP_TOK._and2]
              or copy_3=tokenArray[NSP_TOK._or2]
              or copy_3=tokenArray[NSP_TOK._xor]
              or copy_3=tokenArray[NSP_TOK.assign]   ) {

     token=copy_3;
     if nsp_token_is_valid(token,string_copy(work_str,i-1,3+2)) {

      if i<>1 ds_list_add(list,string_copy(work_str,1,i-1));
      ds_list_add(list,token);
      work_str=string_delete(work_str,1,i+2);
      break;
    
      }
    
     }
     //Tokens of length 2:
     else if (   copy_2=tokenArray[NSP_TOK.multiply]
              or copy_2=tokenArray[NSP_TOK.divide]
              or copy_2=tokenArray[NSP_TOK._div]
              or copy_2=tokenArray[NSP_TOK._mod]
              or copy_2=tokenArray[NSP_TOK._power]
              or copy_2=tokenArray[NSP_TOK.add]
              or copy_2=tokenArray[NSP_TOK.subtract]
              or copy_2=tokenArray[NSP_TOK.equal]
              or copy_2=tokenArray[NSP_TOK.larger]
              or copy_2=tokenArray[NSP_TOK.larger_equal]
              or copy_2=tokenArray[NSP_TOK.smaller]
              or copy_2=tokenArray[NSP_TOK.smaller_equal]
              or copy_2=tokenArray[NSP_TOK.unequal]
              or copy_2=tokenArray[NSP_TOK._and]
              or copy_2=tokenArray[NSP_TOK._or]
              or copy_2=tokenArray[NSP_TOK._and2]
              or copy_2=tokenArray[NSP_TOK._or2]
              or copy_2=tokenArray[NSP_TOK._xor]
              or copy_2=tokenArray[NSP_TOK.assign]   ) {
            
      token=copy_2;
      if nsp_token_is_valid(token,string_copy(work_str,i-1,2+2)) {

       if i<>1 ds_list_add(list,string_copy(work_str,1,i-1));
       ds_list_add(list,token);
       work_str=string_delete(work_str,1,i+1);
       break;
     
       }
            
      }
      //Tokens of length 1:
      else if (   copy_1=tokenArray[NSP_TOK.multiply]
               or copy_1=tokenArray[NSP_TOK.divide]
               or copy_1=tokenArray[NSP_TOK._div]
               or copy_1=tokenArray[NSP_TOK._mod]
               or copy_1=tokenArray[NSP_TOK._power]
               or copy_1=tokenArray[NSP_TOK.add]
               or copy_1=tokenArray[NSP_TOK.subtract]
               or copy_1=tokenArray[NSP_TOK.equal]
               or copy_1=tokenArray[NSP_TOK.larger]
               or copy_1=tokenArray[NSP_TOK.larger_equal]
               or copy_1=tokenArray[NSP_TOK.smaller]
               or copy_1=tokenArray[NSP_TOK.smaller_equal]
               or copy_1=tokenArray[NSP_TOK.unequal]
               or copy_1=tokenArray[NSP_TOK._and]
               or copy_1=tokenArray[NSP_TOK._or]
               or copy_1=tokenArray[NSP_TOK._and2]
               or copy_1=tokenArray[NSP_TOK._or2]
               or copy_1=tokenArray[NSP_TOK._xor]
               or copy_1=tokenArray[NSP_TOK.assign]   ) {
             
       token=copy_1;
      if nsp_token_is_valid(token,string_copy(work_str,i-1,1+2)) {

        if i<>1 ds_list_add(list,string_copy(work_str,1,i-1));
        ds_list_add(list,token);
        work_str=string_delete(work_str,1,i);
        break;
      
        }
             
       }
       else if i=string_length(work_str) {
        ds_list_add(list,work_str);
        work_str="";
        break;
        }
     
   }
          
 end;


 }
 
//Finalize:
i=0;
while (i<ds_list_size(list)) begin

 list[|i]=nsp_string_crop(list[|i]);
 
 switch (list[|i]) begin
 
  case "true":
    list[|i]="1";
   break;
   
  case "false":
    list[|i]="0";
   break;
   
  case "begin":
    list[|i]="{";
   break;
   
  case "end":
    list[|i]="}";
   break;
   
  case "-":
    if tokenArray[NSP_TOK.subtract]="-" {
     if !nsp_is_number(list[|i-1]) and nsp_is_number(list[|i+1]) and real(list[|i+1])>0 {
      list[|i+1]="-"+nsp_string_crop(list[|i+1]);
      ds_list_delete(list,i);
      }
     }
   break;
   
  case "global":
    list[|i+1]="global"+nsp_string_crop(list[|i+1]);
    ds_list_delete(list,i);
   break;
   
  case "":
    ds_list_delete(list,i);
    i-=1;
   break;
   
  default:
    var c;
    c=nsp_get_constant(list[|i]);
    if (c<>-9999)
     list[|i]=string(c);
   break;
 
 end;
 
 i+=1;

end;

