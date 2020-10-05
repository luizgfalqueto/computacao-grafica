PImage img, imgV, imgH;

void setup(){
   size(1000,1000);
   background(255);
   noLoop();
   img = loadImage("praia.png");
   imgH = loadImage("praia.png");
   
   //int tamanho = img.width*img.height;
  
   img.loadPixels();
   imgH.loadPixels();
   
   int l = img.width-1;
   int c = 0;
   
   for(int x=0; x<imgH.width; x++){
      for(int y=0; y<imgH.height; y++){
         imgH.set(x,y,img.get(c,l));
         l-=1;
         c+=1;
      }
   }
   
   img.updatePixels();
   imgH.updatePixels();
}

void draw(){
   image(img,10,10);
   image(imgH,imgH.width+30,10);
}
