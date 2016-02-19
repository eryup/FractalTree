private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
private int sizeX = 800;
private int sizeY= 800;
public void setup() 
{   
	size(sizeX,sizeY);    
	noLoop(); 
} 

public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(sizeX/2,sizeY,sizeX/2,sizeY-100);   
	drawBranches(sizeX/2,sizeY-100,100,3*Math.PI/2);  //will add later 


} 
	public void keyPressed() {
	 if (key == CODED) {
     if (keyCode == UP&&fractionLength<.95) {
      fractionLength=fractionLength+.02;
      smallestBranch=smallestBranch-1;
    	} 
    else if (keyCode == DOWN) {
      fractionLength=fractionLength-.02;
      smallestBranch=smallestBranch+1;
   	 } 
   	 else
   	 {}
  }
  redraw();
	}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1=angle+branchAngle;
	double angle2=angle-branchAngle;
	branchLength=branchLength*fractionLength;
	int endX1, endY1, endX2, endY2;
	endX1 = (int)(branchLength*Math.cos(angle1) + x);
	endY1 = (int)(branchLength*Math.sin(angle1) + y);
	endX2 = (int)(branchLength*Math.cos(angle2) + x);
	endY2 = (int)(branchLength*Math.sin(angle2) + y);
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);
	if(branchLength>smallestBranch)
	{
		drawBranches(endX1,endY1,branchLength,angle1);
		drawBranches(endX2,endY2,branchLength,angle2);
	}
} 
