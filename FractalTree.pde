private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(320,480,320,380);   
	drawBranches(320,380,160,Math.PI/6);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	float angle1=(float)(angle-Math.PI/2);
		float angle2=(float)(angle+Math.PI);
		int endX1=x+(int)((float)(branchLength)*Math.cos(angle1));
		int endY1=y+(int)((float)(branchLength)*Math.sin(angle1));
		int endX2=x+(int)((float)(branchLength)*Math.cos(angle2));
		int endY2=y+(int)((float)(branchLength)*Math.sin(angle2));

	if(branchLength<=1)
	{
		line(endX1,endY1,x+1,y+1);
		line(endX2,endY2,x-1,y+1);
	}
	else
	{
		stroke(0,255,0);
		line(x,y,endX1,endY1);
		line(x,y,endX2,endY2);
		line(x,y,endX1,endY2);
		line(x,y,endX2,endY1);
		drawBranches(endX1,endY1,branchLength/2,angle*2);
		drawBranches(endX2,endY2,branchLength/2,angle*2);
		stroke(255,0,0);
		drawBranches(endX1,endY2,branchLength/2,angle);
		drawBranches(endX2,endY1,branchLength/2,angle);
	}
} 
