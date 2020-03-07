///nsp_type_is_a_value(Type)
/*

*/
var type;

type = argument[0];

if (type == NSP_TYPE._number or
    type == NSP_TYPE._string or
    type == NSP_TYPE._script or
    type == NSP_TYPE._asset  or
    type == NSP_TYPE._variablesl or
    type == NSP_TYPE._variablecl or
    type == NSP_TYPE._variablegl or
    type == NSP_TYPE._dsm)
  return 1;

return 0;
