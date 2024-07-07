
//this is the main game scene
void drawBackground2(){
  background(bgImage);

  
}
void updateEnemyPositions() {
    if (!isEnemyInitialized) return;

    for (int i = 0; i < enemyX.length; i++) {
        // Update Y position based on direction
        enemyY[i] += enemySpeed[i] * enemyDirectionY[i];

        // Vertical screen boundary check and bounce
        if (enemyY[i] <= 0 || enemyY[i] >= height - enemyImage.height) {
            enemyDirectionY[i] *= -1; // Reverse direction upon hitting top or bottom
        }
    }
}


// Adjust to draw multiple enemies
void drawEnemies() {
    if (!isEnemyInitialized) return;

    for (int i = 0; i < enemyX.length; i++) {
        image(enemyImage, enemyX[i], enemyY[i]);
    }
}

void drawPlayer2(){
    float fenceX = 8.5*W;
  // Allow player to move beyond the fence if it's open
  if(isFenceOpen || mouseX < fenceX) {
    image(loadImage("playerBlue_dead.png"), mouseX, y);
  } else {
    // When the fence is closed, restrict the player's movement up to the fence's position
    image(loadImage("playerBlue_dead.png"), min(mouseX, fenceX - 1), y); // Subtracting 1 to ensure the player doesn't go into the fence
  }
  }

void drawPlatform2(){
PImage tile13 = loadImage("tile_0002.png"); 
  for(int col=40;col>6;col--)
    image(tile13,col*z,25*j+10);  
  image(loadImage("tile_0003.png"),27*z,25*j+10);
  image(loadImage("house_grey_side.png"),W,4*H+50);
   //image(loadImage("fluidBlue_top.png"),11*W+16,7*H);
   
  
}
void checkCollisionWithPlayer() {
    for (int i = 0; i < enemyX.length; i++) {
        float distance = dist(mouseX, mouseY, enemyX[i] + enemyImage.width / 2, enemyY[i] + enemyImage.height / 2);
        
        // Assuming the player's "hitbox" is roughly the same size as the enemies
        if (distance < (enemyImage.width / 2 + 45 / 2)) {
            // Collision detected, perform an action
            // For example, reset the scene, reduce player's life, etc.
           scn=4;
            // Implement your reaction to the collision here
            
            // Example: Resetting the enemy's position or removing the enemy
            // enemyY[i] = -100; // Move enemy out of the screen (simple reaction)
            
            // More complex reactions can include decreasing player health, game over mechanics, etc.
        }
    }
}

void checkSceneTransition2() {
    // Assuming bridgeEndX represents the x-coordinate of the bridge's end
    // and isFenceOpen indicates if the bridge (fence) is passable
    if (mouseX<10) {
        scn++; // Increment scene counter
         // Prevent multiple increments for the same crossing
    }
}

void scene2(){
    
  //draw background -- REQ: move to a function called drawBackground()
  drawBackground2();
  
  
  

  //draw player -- REQ: move to a function called drawPlayer()
  
  drawPlayer2();
  //draw platform -- REQ: move to a function called drawPlatform()
  drawPlatform2();
  
  //move player -- REQ: move to a function called movePlayer() 
  updateEnemyPositions(); // Update enemy's position based on the current approach mode

  drawEnemies(); // Draw the enemy on the screen
  checkCollisionWithPlayer();
  
  checkSceneTransition2();

}
