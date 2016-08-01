///nsp_list_parameters(String List, Target List)
/*
Underlying NSP script.
*/
var nspToken=global.nspToken;
var a,str_list,par_list;

str_list=argument0;
par_list=argument1;

for (i=0; i<ds_list_size(str_list); i+=1) begin
 
 a=nsp_is_variable(str_list[|i]);
 
 if str_list[|i]="{" or str_list[|i]="}"
 or str_list[|i]="(" or str_list[|i]=")"
 or str_list[|i]="," or str_list[|i]=";" {
  ds_list_add(par_list,NSP_TYPE._symbol);
  }
  else if str_list[|i]=nspToken[NSP_TOK.equal]
       or str_list[|i]=nspToken[NSP_TOK.unequal]
       or str_list[|i]=nspToken[NSP_TOK.larger]
       or str_list[|i]=nspToken[NSP_TOK.larger_equal]
       or str_list[|i]=nspToken[NSP_TOK.smaller]
       or str_list[|i]=nspToken[NSP_TOK.smaller_equal]
       or str_list[|i]=nspToken[NSP_TOK._and]
       or str_list[|i]=nspToken[NSP_TOK._or]
       or str_list[|i]=nspToken[NSP_TOK._xor]
       or str_list[|i]=nspToken[NSP_TOK.add]
       or str_list[|i]=nspToken[NSP_TOK.subtract]
       or str_list[|i]=nspToken[NSP_TOK.multiply]
       or str_list[|i]=nspToken[NSP_TOK.divide]
       or str_list[|i]=nspToken[NSP_TOK._mod]
       or str_list[|i]=nspToken[NSP_TOK._div]
       or str_list[|i]=nspToken[NSP_TOK._power]
       or str_list[|i]=nspToken[NSP_TOK.assign] {
   ds_list_add(par_list,NSP_TYPE._token);
   }
   else if nsp_is_number(str_list[|i]) {
    ds_list_add(par_list,NSP_TYPE._number);
    }
    else if nsp_is_string(str_list[|i]) {
     ds_list_add(par_list,NSP_TYPE._string);
     }
     else if nsp_is_special_word(str_list[|i]) {
      ds_list_add(par_list,NSP_TYPE._specword);
      }
      else if ((i<>ds_list_size(str_list)-1) and (str_list[|i+1]="(")) {
       ds_list_add(par_list,NSP_TYPE._script);
       }
       else if nsp_is_asset(str_list[|i]) {
        ds_list_add(par_list,NSP_TYPE._asset);
        }
        else if nsp_is_dsm(str_list[|i]) {
         ds_list_add(par_list,NSP_TYPE._dsm);
         }
         else if a<>0 {
          if a=1 ds_list_add(par_list,NSP_TYPE._variablesl)
           else if a=2 ds_list_add(par_list,NSP_TYPE._variablecl)
            else if a=3 ds_list_add(par_list,NSP_TYPE._variablegl);
          }
          else {
           ds_list_add(par_list,-1);
           }

end;

