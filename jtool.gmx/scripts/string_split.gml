//string_split(str, num ,delimiter)
//ARGUMENTS:
//0         -       string to split
//1         -       substring number
//2         -       delimiter to use
// http://gmc.yoyogames.com/index.php?showtopic=214472&p=1493524
var num, newVal, sepNum, delemiter;
num    = argument1
newVal = ""
sepNum = 0
delemiter = argument2

for (i=1; i<string_length(argument0)+1; i+=1)
{
	if (string_char_at(argument0,i) = delemiter)
	{
  sepNum += 1
  i += 1
	}
	if (sepNum = num)
	{
  newVal += string_char_at(argument0,i)
	}
}

return(newVal)