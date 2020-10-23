Bacteria[] maya; 
void setup()   
{     

  size (500, 500);
  frameRate(10);
  maya = new Bacteria [100]; //creates apartment building with bacteria
  for (int i = 0; i < maya.length; i++) //puts a bacteria in each apartment
  {
    maya[i] = new Bacteria();
  }
}   
void draw()   
{   
  background(0);
  for (int i = 0; i < maya.length; i++) //shows each bacteria
  {
    maya[i].show();
    maya[i].move();
  }
}  

class Bacteria    
{     
  int myX;
  int myY;
  int myColor;
  boolean popped;
  Bacteria () //constructor
  {
    popped = false;
    myX = (int)(Math.random()*450)+25;
    myY = (int)(Math.random()*450)+25;
    myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*700));
  }

  void move()
  {
    myX = myX + (int)(Math.random() * 3)-1; //random walk
    myY = myY + (int)(Math.random() * 3)-1; //random walk
    
    if (myX > 500 || myX < 0) //resets if they go off screen
      myX = (int)(Math.random() * 500);
      
    if (myY > 500 || myY < 0) //resets if they go off screen
      myY = (int)(Math.random() * 500);
      
    myX = myX + (int)(Math.random() * 3)-1;
    myY = myY + (int)(Math.random() * 3)-1;
  }

  void show()
  {
    if (dist(mouseX, mouseY, myX, myY) < 10) //used to pop the bacteria
    {
      popped = true;
    }
    if (keyPressed == true) //used to redraw the bacterias if spacebar clicked
    {
      popped = false;
    }
    if (popped == false) //draws the bacteria if mouse is not hovering
    {
        noStroke();
        fill(myColor);
        ellipse (myX, myY, 20, 20);
    }
  }
}  
