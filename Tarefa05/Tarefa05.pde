
PImage origin;
PImage destiny;

void setup(){
   size(900,900);
   background(0);
   origin = loadImage("beija_flor.png");
   origin.loadPixels();
   destiny = createImage(origin.width+300, origin.height+250, RGB);
}

void rotaciona(float angle){
  
    for (int x=0 ; x<origin.width; x++){
      for(int y=0; y<origin.height;y++){
          color c = origin.get(x,y);
          destiny.set(round(x * cos(angle) - y * sin(angle))+80,round(x*sin(angle) + y*cos(angle))+360,c);
      }
    }   
}

void draw(){
   pushMatrix();
   rotaciona(radians(-45));
   popMatrix();
   destiny.updatePixels();
   image(destiny,0,0);
   saveFrame("saida.png");
}
