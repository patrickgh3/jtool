///NSP_initialize()
/*

Initializes the parser (for more info read NSP Documentation).

Data that will be used:

 NSP_TOK               (enum)
 NSP_TYPE              (enum)
 global.nspToken       (1d array)
 global.nspListSaved   (ds_list)
 global.nspDsMap       (ds_map)
 
 Obsolete:
  global.nspListStr     (ds_list)
  global.nspListPar     (ds_list)

Returns: n/a 

*/

//*** Nomenclature: (Do not change this enumerator)
enum NSP_TOK {
 //Comparing:
 equal, unequal,
 larger, larger_equal,
 smaller, smaller_equal,
 //Combining:
 _and, _or, _xor,
 //Math:
 add, subtract,
 multiply, divide, 
 _div, _mod,
 _power, 
 //Other:
 abort, quote, assign, dsm_name, dsm_allowed
 };
 
/*LOCKED CHARACTERS: (These characters cannot be used as tokens, however, note that the minus ("-") can
still be used as the operator for subtraction, but ONLY for subtraction.)
( ) { } - ; . ,

*/
 
// Tokens can be letters-only or contain no letters at all,
// and 1 to 3 characters in length.

//COMBINING:
global.nspToken[NSP_TOK._and]          = "and";
global.nspToken[NSP_TOK._or]           = "or";
global.nspToken[NSP_TOK._xor]          = "xor";

//COMPARING:
global.nspToken[NSP_TOK.equal]         = "==";
global.nspToken[NSP_TOK.larger]        = ">";
global.nspToken[NSP_TOK.larger_equal]  = ">=";
global.nspToken[NSP_TOK.smaller]       = "<";
global.nspToken[NSP_TOK.smaller_equal] = "<=";
global.nspToken[NSP_TOK.unequal]       = "<>";

//MATH:
global.nspToken[NSP_TOK.add]           = "+";
global.nspToken[NSP_TOK.subtract]      = "-";
global.nspToken[NSP_TOK.multiply]      = "*";
global.nspToken[NSP_TOK.divide]        = "/";
global.nspToken[NSP_TOK._div]          = "div";
global.nspToken[NSP_TOK._mod]          = "mod";
global.nspToken[NSP_TOK._power]        = "^";

//BITWISE:
//Currently not supported.

//OTHER:
global.nspToken[NSP_TOK.assign] = "=";           // Assignment operator. NOTE: In code, you can put your 
                                                 // defined operator for adding, subtracting, dividing or
                                                 // multiplying before the assignment operator to do
                                                 // things like x+=32;
global.nspToken[NSP_TOK.abort] = "_NSP_ABORT_";  // String to return upon failure.
global.nspToken[NSP_TOK.quote] = "'";            // For beginnigs and ends of strings (within strings).
                                                 // Must be a single character!

//DSM:                                      
global.nspToken[NSP_TOK.dsm_allowed] = 1;        // Whether DSM is allowed: 1 = Yes, 0 = No.
global.nspToken[NSP_TOK.dsm_name]    = "NSP_DSM";// Only relevant if DSM is allowed.

//VARIABLE SYSTEM:
enum NSP_VAR_SYS {

  new = 1           // If you want to use the new variable system (using the new variable_* functions) set new = 1.
                    // Otherwise set new = 0 to use the old system (not recommended).
  }

//*** Other: (Do not change this part)
//global.nspListStr = ds_list_create();
//global.nspListPar = ds_list_create();
global.nspListSaved = ds_list_create();

if (global.nspToken[NSP_TOK.dsm_allowed] == 1)
  global.nspDsMap = ds_map_create();
else
  global.nspDsMap = -1;
 
//*** Data types: (Do not change this enumerator)
enum NSP_TYPE {
 _symbol, //0
 _operator,
 _number,
 _string,
 _script, //4
 _asset,
 _variablesl,
 _variablecl,
 _variablegl, //8
 _dsm,
 _specword
 }
