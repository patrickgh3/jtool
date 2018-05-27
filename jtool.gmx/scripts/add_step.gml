global.add+=1
switch(argument0)
{
case "Left":
    oRecord.stepLeft[oRecord.maxLeft]=oRecord.oRecordTime
    oRecord.maxLeft+=1
break;
case "Right":
    oRecord.stepRight[oRecord.maxRight]=oRecord.oRecordTime
    oRecord.maxRight+=1
break;
case "StopL":
    oRecord.stepStopL[oRecord.maxStopL]=oRecord.oRecordTime
    oRecord.maxStopL+=1
break;
case "StopR":
    oRecord.stepStopR[oRecord.maxStopR]=oRecord.oRecordTime
    oRecord.maxStopR+=1
break;
case "Jump":
    oRecord.stepJump[oRecord.maxJump]=oRecord.oRecordTime
    oRecord.maxJump+=1
break;
case "Release":
    oRecord.stepRelease[oRecord.maxRelease]=oRecord.oRecordTime
    oRecord.maxRelease+=1
break;
}
