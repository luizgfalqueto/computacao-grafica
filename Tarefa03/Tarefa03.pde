  PImage img, img1;

int maiorValorCor(int pixel[]){
  int m = pixel[0];
  
  for(int i = 1; i<pixel.length; i++){
     if(pixel[i] > m){
        m = pixel[i]; 
     }
  }
  return m;
}

void setup() {
 img = loadImage("gokuIn.jpg");
 img1 = loadImage("gokuIn.jpg");
 size(1000, 500);
 
 int pixel = (maiorValorCor(img.pixels));
 
 for(int i=0 ; i<img.width ; i++){
    for(int j=0 ; j<img.height ; j++){
       img.set(i, j, pixel - img.get(i,j)); 
    }
 }
 
}

void draw(){
 image(img1,0,0);
 image(img,500,0);
 
 saveFrame("gokuOut.png");
}
