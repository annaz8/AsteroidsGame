Spaceship anna;
Asteroids[] asteroid = new Asteroids[50];
Star[] stars = new Star[100];
public void setup() 
{
  size(600,600);
  anna = new Spaceship();
  for(int i = 0; i < 100; i++)
  {
    stars[i] = new Star();
  }
  for (int a = 0; a < 50; a++)
  {
    asteroid[a] = new Asteroids();
  }
}
public void draw() 
{
  background(0);
  anna.show();
  anna.move();
  for(int i = 0; i < 100; i++)
  {
    stars[i].show();
  }
  for (int a = 0; a < 50; a++)
  {
    asteroid[a].show();
    asteroid[a].move();
  }
}

public void keyPressed()
{
  if (key == 'a')
  {
    anna.rotate(-5);
  }
  if(key == 'd')
  {
    anna.rotate(5);
  }
  if(key == 'w')
  {
    anna.accelerate(0.5);
  }
  if (key == 's')
  {
    anna.setPointDirection((int)(Math.random()*600));
    anna.setDirectionX(0);
    anna.setDirectionY(0);
    anna.setX((int)(Math.random()*600));
    anna.setY((int)(Math.random()*600)); 
  }
} 

class Star
{
  int starX, starY,starColor;
  public Star()
  {
    starX = (int)(Math.random()*600);
    starY = (int)(Math.random()*600);
    starColor = 255;
  }
  public void show()
  {
    stroke(starColor);
    point(starX, starY);
  }
}

class Spaceship extends Floater  
{   
  public Spaceship()
  {
      corners = 4;
      int[] xS = {-5,10,-5,-2};
      int[] yS = {-5,0,5,0};
      xCorners = xS;
      yCorners = yS;
      myColor = 180;
      myCenterX = 300;
      myCenterY = 300;
      myDirectionX = 0;
      myDirectionY = 0;
      
  }
  public void setX(int x)  
  {
    myCenterX = x;
  }
  public int getX()
  {
    return (int)myCenterX;
  }   
  public void setY(int y)
  {
    myCenterY = y;
  }   
  public int getY()
  {
    return (int)myCenterY;
  }   
  public void setDirectionX(double x)
  {
    myDirectionX = x;
  }   
  public double getDirectionX()
  {
    return (double)myDirectionX;
  }  
  public void setDirectionY(double y)
  {
    myDirectionY = y;
  }   
  public double getDirectionY()
  {
    return (double)myDirectionY;
  }   
 public void setPointDirection(int degrees)
  {
    myPointDirection = degrees;
  }   
  public double getPointDirection()
  {
    return (double)myPointDirection;
  }

}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 


 //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
class Asteroids extends Floater 
{
  private int rotSpeed;
  public Asteroids () 
  {
    corners = 5;
    int[] xS = {-4, 0, 0, 4, 6};
    xCorners = xS;   
    int[] xY = {0, 4, -4, 0, -2};
    yCorners = xY;    
    myColor = 230;
    myCenterX = (int)(Math.random()*600);
    myCenterY = (int)(Math.random()*600);
    myDirectionX = (int)(Math.random()*5) - 2;
    myDirectionY = (int)(Math.random()*5) - 2;
    rotSpeed = (int)(Math.random()*5) - 2;
  }
  public void setX(int x)  
  {
    myCenterX = x;
  }
  public int getX()
  {
    return (int)myCenterX;
  }   
  public void setY(int y)
  {
    myCenterY = y;
  }   
  public int getY()
  {
    return (int)myCenterY;
  }   
  public void setDirectionX(double x)
  {
    myDirectionX = x;
  }   
  public double getDirectionX()
  {
    return (double)myDirectionX;
  }  
  public void setDirectionY(double y)
  {
    myDirectionY = y;
  }   
  public double getDirectionY()
  {
    return (double)myDirectionY;
  }   
 public void setPointDirection(int degrees)
  {
    myPointDirection = degrees;
  }   
  public double getPointDirection()
  {
    return (double)myPointDirection;
  }
  public void move()
  {
    rotate(rotSpeed);
    super.move();
  }

}