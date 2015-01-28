private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle =.3;  
public void setup() 
{   
	size(700,700);   
	//noLoop(); 
} 
public void draw() 
{   
	background(0,10);   
	stroke((int)(mouseX+mouseY)/1.91123,(int)mouseX/1.8817,(int)mouseY/1.8134);   
	line(350,700,350,610);   
	drawBranches(350,610,90,3*Math.PI/2);   
} 

public void mouseDragged()
{
  branchAngle=.2+((double)mouseX/640);
  fractionLength= -(double)(mouseY-700)/720;

}

public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1=angle+branchAngle; 
	double angle2=angle-branchAngle; 
	int endX1, endX2, endY1, endY2;
    endX1 = (int)(branchLength*Math.cos(angle1) + x);  
    endY1 = (int)(branchLength*Math.sin(angle1) + y);
    endX2 = (int)(branchLength*Math.cos(angle2) + x);  
    endY2 = (int)(branchLength*Math.sin(angle2) + y);
	branchLength=branchLength*fractionLength;
	line(x,y,endX1,endY1);
    line(x,y,endX2,endY2);
   if (branchLength>= smallestBranch)
   {
      drawBranches(endX1,endY1,branchLength,angle1);
      drawBranches(endX2,endY2,branchLength,angle2);
  }
} 


