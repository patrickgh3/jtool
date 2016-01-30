var title
switch global.joketitleindex mod 22 {
    case 0: title='jtool' break
    case 1: title='I wanna record my hops' break
    case 2: title='I wanna Bravely Behold Frames (I wanna BBF)'break 
    case 3: title='I wanna analyze my jumps' break
    case 4: title='I Wanna Kill The Guy ver1.0' break
    case 5: title='Jump Jump Tool' break
    case 6: title='I Wanna Write Down Whatever Bad Name Wolsk Comes Up With Next' break
    case 7: title='RecordMyBalls' break
    case 8: title='I wanna record pats balls' break
    case 9: title='I wanna git gud' break
    case 10: title="Don't Download This" break
    case 11: title="I wanna make a better tool than geezer did and also it's in studio" break
    case 12: title='I Wanna Make The Jumps cirGasm' break
    case 13: title='I wish to invent the hops' break
    case 14: title='I wanna Kill the RMJ' break
    case 15: title='Not Another RMJ Tool' break
    case 16: title='I have a whimsical desire to construct acrobatic maneuvers' break
    case 17: title='I wanna Jump the Jump Jump' break
    case 18: title='Jump Foreman' break
    case 19: title='cool guy RMJ' break
    case 20: title='jay toul' break
    case 21: title='JFool' break
}

if global.lastloadedmapname != '' {
    window_set_caption(title+' - '+global.lastloadedmapname)
}
else {
    window_set_caption(title)
}
