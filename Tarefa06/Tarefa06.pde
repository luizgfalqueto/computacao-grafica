PImage origin;
PImage destiny;

void setup(){
  size(800,800,P2D);
  background(0);
  origin = loadImage("torreEntrada.png"); //Imagem rotacionada a 33º
  destiny = createImage(origin.width,origin.height+100,RGB); //Objetivo de deixar a imagem com angulação zerada
  origin.loadPixels();
}

float angle = radians(-33);
float X, Y;

void rotaciona(float angle){
  for(int x = 0; x<origin.width ; x++){
     for(int y =0 ; y<origin.height ; y++){
         color c = origin.get(x,y);
         X = x * cos(angle) - y * sin(angle);
         Y = x * sin(angle) + y * cos(angle);
         destiny.set(floor(X)-100, floor(Y)+150, c);
     }
  }
}

void rotacionaInverso (float angle){
  int ajusteY = 170;
  for(int X = 0; X<destiny.width ; X++){
     for(int Y =-ajusteY ; Y<destiny.height; Y++){
         float x = X * cos(angle) + Y * sin(angle);
         float y = X * (-sin(angle)) + Y*cos(angle);
         
         color c = findRGB(x,y);
         destiny.set(X, Y+ajusteY ,c);
     }
  }
}

color findRGB(float x, float y){
  
  //Intensidade do canal R de cada pixel no entorno de P(x,y)
  float pAR = red(origin.get(floor(x), floor(y)));
  float pBR = red(origin.get(ceil(x), floor(y)));
  float pCR = red(origin.get(floor(x), ceil(y)));
  float pDR = red(origin.get(ceil(x), ceil(y)));
  
  //Intensidade do canal G de cada pixel no entorno de P(x,y)
  float pAG = green(origin.get(floor(x), floor(y)));
  float pBG = green(origin.get(ceil(x), floor(y)));
  float pCG = green(origin.get(floor(x), ceil(y)));
  float pDG = green(origin.get(ceil(x), ceil(y)));
  
  //Intensidade do canal B de cada pixel no entorno de P(x,y)
  float pAB = blue(origin.get(floor(x), floor(y)));
  float pBB = blue(origin.get(ceil(x), floor(y)));
  float pCB = blue(origin.get(floor(x), ceil(y)));
  float pDB = blue(origin.get(ceil(x), ceil(y)));
  
  //Variação de coluna e linha de P(x,y)
  float deltaCol = (x - floor(x));
  float deltaLin = (y - floor(y));
  
  //Valores para calcular as novas cores de cada canal
  float ctrlABR = deltaCol * (pBR - pAR) + pAR;
  float ctrlCDR = deltaCol * (pDR - pCR) + pCR;
  
  float ctrlABG = deltaCol * (pBG - pAG) + pAG;
  float ctrlCDG = deltaCol * (pDG - pCG) + pCG;
  
  float ctrlABB = deltaCol * (pBB - pAB) + pAB;
  float ctrlCDB = deltaCol * (pDB - pCB) + pCB;
  
  float PR = deltaLin * (ctrlCDR - ctrlABR) + ctrlABR;
  float PG = deltaLin * (ctrlCDG - ctrlABG) + ctrlABG;
  float PB = deltaLin * (ctrlCDB - ctrlABB) + ctrlABB;
  
  return color(PR, PG, PB);
}

void draw(){
  
  rotaciona(angle); //Rotaciona a imagem, porem com falhas ainda
  destiny.updatePixels();
  
  rotacionaInverso(angle);
  destiny.updatePixels();
  
  image(destiny,50,100);
  saveFrame("torreSaida.png");
}
