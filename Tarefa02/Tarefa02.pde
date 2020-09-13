void setup (){
  size(800,600);
  background(120, 210, 255);
  noLoop();
}

void draw(){
  //grass
  fill(50, 247, 0);
  rect(0,550,800,50);
  
  //building
  fill(227, 227, 227);
  rect(350,50,300,500);
  
  //door
  fill(19, 19, 156);
  rect(440,450,130,100);
  line(505,450,505,550);
  fill(0,0,0);
  ellipse(490,500,10,10);
  ellipse(520,500,10,10);
  
  //windows
    //left windows
    int x;
    int y;
    int closed=0;
    
    for(x=365,y=80;y<450;y=y+74){
      fill(255, 242, 97);
      if (closed==2){
        fill(0,0,0);
        closed = closed+1;
      }
      rect(x,y,60,50);
      rect(x+60,y,60,50);
      closed = closed+1;
    }
    
    //rigth windows
    int j;
    int k;
    int closed1 = 0;
    
    for(x=515,y=80;y<450;y=y+74){
      fill(255, 242, 97);
      if (closed1==1 || closed1==4){
        fill(0,0,0);
        closed1 = closed1+1;
      }
      rect(x,y,60,50);
      rect(x+60,y,60,50);
      closed1 = closed1+1;
    }
      
  //roof
  fill(255,0,0);
  triangle(500,10,340,50,660,50);
  
  //tree
    //tree trunk
    noStroke();
    fill(145, 69, 3);
    rect(130,400,30,150);
    
    //tree leafs
    fill(0,255,0);
    ellipse(100,400,60,60);
    ellipse(130,400,60,60);
    ellipse(160,400,60,60);
    ellipse(190,400,60,60);
    ellipse(115,370,60,60);
    ellipse(145,370,60,60);
    ellipse(175,370,60,60);
    ellipse(145,340,70,70);
    
    //apples
    fill(255,0,0);
    ellipse(115,379,15,15);
    ellipse(146,353,15,15);
    ellipse(170,392,15,15);
    ellipse(135,405,15,15);
    ellipse(146,353,15,15);
    ellipse(110,545,15,15);
  
  //clouds
  fill(255);
  ellipse(100,100,50,50);
  ellipse(150,90,80,80);
  ellipse(200,100,50,50);
    
  saveFrame("foto.png");
}
