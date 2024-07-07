int scn=0;
final int wid=70,high=70;
float[] enemyDirectionY = new float[10]; // Direction for vertical movemen
PImage enemyImage; // Enemy sprite
float[] enemyX = new float[10];
float[] enemyY = new float[10];
// Enemy position
float[] enemySpeed = new float[10];

 // Speed at which the enemy moves towards the player
int approachMode = 0; // 0: Vertical, 1: Horizontal, 2: Diagonal
float playerX, playerY; // To be updated with the player's current position
boolean isEnemyInitialized = false; // To check if the enemy has been initialized

boolean isFenceOpen = false;
final int W=54, H=64; 
final int z=18, j=18;
float fenceEndX = 8.5*W+66;//tile width and height
final int SPEED = 4;   
//character speed: can only be 1,2,4,8,...(for alignmnet)
boolean hasCrossedBridge = false;
int speedX = 0;                   //+ve is right, -ve is left, 0 is not moving, can only be 1,2,4,8,..
int row;                          // for drawing
float x=5*W, y=6*H;               // character initially at 5th tile
float speedY = 0, gravity = 0.2;  // for jumping
boolean isJumping = false;
  int switchposx1 = 7*W;
  int switchposy1 = 6*H+20;
  int switchWidth = W; // Adjust as necessary
  int switchHeight = 50; // Assuming based on your setup
  PImage bgImage; // Declare the image variable at the top of your sketch


void setup(){
     size(640,480); // Set the window size first
  bgImage = loadImage("uncolored_piramids.png");
  bgImage.resize(width, height); // Resize the image to fit the window
 enemyImage = loadImage("enemyFloating_1.png");
    isEnemyInitialized = true;
    
    // Initialize enemies at random positions with random speeds
    
    for (int i = 0; i < enemyX.length; i++) {
        enemyX[i] = random(width-50); // Random horizontal position
        enemyY[i] = random(height); // Random vertical position
        enemySpeed[i] = random(0.5, 1.5); // Random speed for more natural movement
        enemyDirectionY[i] = random(1) > 0.5 ? 1 : -1; // Random initial vertical direction
    }
    
    frameRate(120); // Use a smoother frame rate
}


void draw(){
  switch(scn){
    case 0: scene0();break;
    case 1: scene1();break;
    case 2: scene2();break;
    case 3:scene3();break;
    case 4:scene4();break;
}}
