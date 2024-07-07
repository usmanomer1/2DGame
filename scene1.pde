

//this is the main game scene
void drawBackground(){
  background(loadImage("set1_background.png"));

  
}
void drawPlayer(){
    float fenceX = 8.5*W;
  // Allow player to move beyond the fence if it's open
  if(isFenceOpen || mouseX < fenceX) {
    image(loadImage("playerBlue_dead.png"), mouseX, y);
  } else {
    // When the fence is closed, restrict the player's movement up to the fence's position
    image(loadImage("playerBlue_dead.png"), min(mouseX, fenceX - 1), y); // Subtracting 1 to ensure the player doesn't go into the fence
  }
  }

void drawPlatform(){
PImage tile13 = loadImage("tileBlue_27.png"); 
  for(int col=0;col<9;col++)
    image(tile13,col*W,7*H);  
  image(loadImage("tileBlue_01.png"),9*W,7*H);
  image(loadImage("fluidBlue_top.png"),10*W+6,7*H);
   image(loadImage("fluidBlue_top.png"),11*W+16,7*H);
   
  
}

void drawCastle(){
      for(int i=0;i<5;i++){
        for(int j=0;j<3;j++){
          if (j==1) image(loadImage("medievalTile_112.png"),wid*i,high*i);
          else if(i==0) image(loadImage("medievalTile_066.png"),wid*i,high*i);
          else image(loadImage("medievalTile_068.png"),wid*i,high*i);
          
        }
        
        
      }
}
void drawSwitches(){

 
  
  // Display the fence and switch based on isFenceOpen
  if(isFenceOpen){
    image(loadImage("fenceOpen.png"), 8.5*W, 6*H+20);
    image(loadImage("switchGreen_right.png"), switchposx1, switchposy1);
  } else {
    image(loadImage("fence.png"), 8.5*W, 6*H+20);
    image(loadImage("switchRed_left.png"), switchposx1, switchposy1);
  }
}


  

void mousePressed() {
   if( mouseX > switchposx1 && mouseX < switchposx1 + switchWidth && mouseY > switchposy1 && mouseY < switchposy1 + switchHeight){
    isFenceOpen = !isFenceOpen; // Toggle the state of the fence
  }
  

}

void checkSceneTransition() {
    // Assuming bridgeEndX represents the x-coordinate of the bridge's end
    // and isFenceOpen indicates if the bridge (fence) is passable
    if (isFenceOpen && mouseX > fenceEndX && !hasCrossedBridge) {
        scn++; // Increment scene counter
        hasCrossedBridge = true; // Prevent multiple increments for the same crossing
    } else if (mouseX <= fenceEndX) {
        hasCrossedBridge = false; // Reset flag when the player returns before the bridge's end
    }
}

void scene1(){

     
  //draw background -- REQ: move to a function called drawBackground()
  drawBackground();
  drawCastle();
   
  
  drawSwitches();
  

  //draw player -- REQ: move to a function called drawPlayer()
  
  drawPlayer();
  //draw platform -- REQ: move to a function called drawPlatform()
  drawPlatform();
 
  

  //jumping  -- REQ: move to a function called jumpPlayer() 

  checkSceneTransition();
  
   
 

}
