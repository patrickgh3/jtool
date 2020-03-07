///nsp_type_name(Type)
/*

*/
var type;

type = argument[0];

switch (type) {

  case NSP_TYPE._symbol: return "symbol";
  
  case NSP_TYPE._operator: return "operator";
  
  case NSP_TYPE._number: return "number";
  
  case NSP_TYPE._string: return "string";
  
  case NSP_TYPE._script: return "script (function)";
  
  case NSP_TYPE._asset: return "asset";
  
  case NSP_TYPE._variablesl: return "variable (sl)";
  
  case NSP_TYPE._variablecl: return "variable (cl)";
  
  case NSP_TYPE._variablegl: return "variable (gl)";
  
  case NSP_TYPE._dsm: return "dsm";
  
  case NSP_TYPE._specword: return "specword";
  
  default: return "unknown";
 
  }
