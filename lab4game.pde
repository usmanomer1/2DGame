void keyReleased(){
  
 if(scn==0 && (key=='P'||key=='p'))
scn = 1;
if(scn==0 && (key=='E'||key=='e'))
exit();
if(scn==3 &&(key=='R'|| key=='r'))
scn=1;
if(scn==1 &&(key=='M'|| key=='m'))
scn=0;
if(scn==2 &&(key=='M'|| key=='m'))
scn=0;
if(scn==4 &&(key=='R'|| key=='r'))
scn=1;
if(scn==4 &&(key=='E'|| key=='e'))
exit();
}
