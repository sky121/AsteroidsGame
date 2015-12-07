SpaceShip sky = new SpaceShip();
Stars [] s;
//Asteroids [] a;
ArrayList <Asteroids> theList;

//Asteroids a = new Asteroids();
public void setup() 
{

  size(500, 500);
  theList = new ArrayList <Asteroids>();
  s = new Stars[(int)(Math.random()*50+30)];
  // a = new Asteroids();
  for (int i =0; i<s.length; i++) {
    s[i] = new Stars();
  }  
//  a = new Asteroids[20];
  /*
 for(int i = 0; i<a.length; i++){
   a[i] = new Asteroids();
   }*/
  for (int i = 0; i<20; i++) {
    theList.add(new Asteroids());
  }

  //your code here
}
public void draw() 
{
  //  Asteroids.show();

  for (int i =0; i<s.length; i++) {
    s[i].show();
  } 

  for (int nI = 0; nI < theList.size (); nI++)
  {
    Asteroids anotherThing = theList.get(nI);
    anotherThing.show();
    anotherThing.move();
    anotherThing.rotate((int)(Math.random()* 10));
    anotherThing.accelerate(0.1);
  }
  /*
    for(int i =0; i<a.length; i++){
   a[i].show();
   a[i].move();
   a[i].rotate((int)(Math.random()* 10));
   a[i].accelerate(0.1);
   } 
   */
  fill(0, 0, 0, 30);
  rect(-1, -1, 600, 600);
  fill(255, 0, 0);
  sky.show();
  //  if(keyPressed){
  //   if(key == 'w')  
  sky.move();
  //  }

  if (keyPressed) {
    if (key == 'h') {
      sky.setX((int)(Math.random()*500));
      sky.setY((int)(Math.random()*500));

      sky.setDirectionX(0);
      sky.setDirectionY(0);
    }
  }

  if (keyPressed) {
    if (key == 'w')
      sky.accelerate(0.1);
  }
  if (keyPressed) {
    if (key == 's')
      sky.accelerate(-0.1);
  }
  if (keyPressed) {
    if (key == 'd')
      sky.rotate(5);
  }
  if (keyPressed) {
    if (key == 'a')
      sky.rotate(-5);
  }
  //a.move(); 
  //a.show();
  // a.rotate((int)(Math.random()* 10));
  //a.accelerate(0.1);
  //your code here
}

class Asteroids extends Floater
{
  private double myxSpd = Math.random()*3-2;
  private double myySpd = Math.random()*3-2;
  private int rotSpd = (int)Math.random()* 20-10;
  Asteroids() {

    int corners = 3;  //the number of corners, a triangular floater has 3   
    int[] xCorners;   
    int[] yCorners;   
    int myColor;   
    double myCenterX, myCenterY; //holds center coordinates   
    double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
    double myPointDirection; //holds current direction the ship is pointing in degrees
  }
  public void setX(int x) {
    myCenterX = x;
  }  
  public double getX() {
    return myCenterX;
  } 
  public void setY(int y) {
    myCenterY=y;
  }   
  public double getY() {
    return myCenterY;
  }   
  public void setDirectionX(double x) {
    myDirectionX= x;
  }   
  public double getDirectionX() {
    return myDirectionX;
  }  
  public void setDirectionY(double y) {
    myDirectionY=y;
  }  
  public double getDirectionY() {
    return myDirectionY;
  } 
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }
  public double getPointDirection() {
    return myPointDirection;
  }
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY  
    myPointDirection+=rotSpd;   
    myCenterX += myxSpd;

    myCenterY += myySpd;     

    //wrap around screen    
    if (myCenterX >width)
    {     
      myCenterX = 0;
    } else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;
    } else if (myCenterY < 0)
    {     
      myCenterY = height;
    }
  }
  public void show ()  //Draws the floater at the current position  
  {    


    fill(5, 5, 5);   
    stroke(255, 0, 0); 

    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for (int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated, yRotatedTranslated);
    }   
    corners = 6;



    xCorners = new int[corners];

    yCorners = new int[corners];

    xCorners[0] = -11;

    yCorners[0] = -8;

    xCorners[1] = 7;

    yCorners[1] = -8;

    xCorners[2] = 13;

    yCorners[2] = 0;

    xCorners[3] = 6;

    yCorners[3] = 10;

    xCorners[4] = -11;

    yCorners[4] = 8;

    xCorners[5] = -5;

    yCorners[5] = 0;
    endShape(CLOSE);
  }
}
class SpaceShip extends Floater  
{   
  //your code here
  SpaceShip() {
    int corners = 3;  //the number of corners, a triangular floater has 3   
    int[] xCorners;   
    int[] yCorners;   
    int myColor;   
    double myCenterX, myCenterY; //holds center coordinates   
    double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
    double myPointDirection; //holds current direction the ship is pointing in degrees
  }

  public void setX(int x) {
    myCenterX = x;
  }  
  public double getX() {
    return myCenterX;
  } 
  public void setY(int y) {
    myCenterY=y;
  }   
  public double getY() {
    return myCenterY;
  }   
  public void setDirectionX(double x) {
    myDirectionX= x;
  }   
  public double getDirectionX() {
    return myDirectionX;
  }  
  public void setDirectionY(double y) {
    myDirectionY=y;
  }  
  public double getDirectionY() {
    return myDirectionY;
  } 
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }
  public double getPointDirection() {
    return myPointDirection;
  }
}

class Stars
{
  int x, y;
  Stars() {


    x = (int)(Math.random()*500);
    y = (int)(Math.random()*500);
  }
  void show() {
    fill(255, 255, 255);
    ellipse(x, y, 5, 5);
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
  abstract public double getX();   
  abstract public void setY(int y);   
  abstract public double getY();   
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
    if (myCenterX >width)
    {     
      myCenterX = 0;
    } else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;
    } else if (myCenterY < 0)
    {     
      myCenterY = height;
    }
  }   
  public void show ()  //Draws the floater at the current position  
  {    


    fill(0, 0, 255);   
    stroke(255, 0, 0); 

    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for (int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated, yRotatedTranslated);
    }   
    corners = 4;
    int[] xS = {
      -8, 16, -8, -2
    };
    int[] yS = {
      -8, 0, 8, 0
    }; 
    xCorners = xS;
    yCorners = yS;
    endShape(CLOSE);
  }
}
