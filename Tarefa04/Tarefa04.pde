PImage origin;
PImage destinyV;
PImage destinyH;

void setup(){
   size(500,649);
   background(255);
   origin = loadImage("imagem.png");
   destinyH = createImage(origin.width, origin.height, RGB);
   destinyV = createImage(origin.width, origin.height, RGB);
   
   origin.loadPixels();
}

void espelharV(int altura){
      for (int x = 0; x < origin.width; x++) {
      
      for (int y = 0; y < origin.height; y++ ) {
        color c = origin.get(x,y);
        destinyV.set(x,altura, c);
        altura--;
      }
        altura = origin.height-1;
      }  
}

void espelharH(int largura){
    for (int x = 0; x < origin.width; x++) {
    
    for (int y = 0; y < origin.height; y++ ) {
      color c = origin.get(x,y);
      destinyH.set(largura,y, c);
    }
    largura--;
  }
}

void draw(){
  espelharV(origin.height-1);
  destinyV.updatePixels();
  
  image(destinyV,0,0);
  saveFrame("imagemEspelhadaVertical.png");
  
  espelharH(origin.width-1);
  destinyH.updatePixels();
  
  image(destinyH,0,0);
  saveFrame("imagemEspelhadaHorizontal.png");
}
