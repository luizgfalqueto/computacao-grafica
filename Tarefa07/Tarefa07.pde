PFont f;

void setup(){
   size(710,510);
   f = createFont("Arial",16,true);
}

int borda = 4;
int larguraBandeira = 700;
int alturaBandeira = 500;

//Canais do fundo da bandeira
int RedFundoBandeira;
int GreenFundoBandeira;
int BlueFundoBandeira;

//Canais do losango da bandeira
int RedLosangoBandeira;
int GreenLosangoBandeira;
int BlueLosangoBandeira;

//Canais do circulo da bandeira
int RedCirculoBandeira;
int GreenCirculoBandeira;
int BlueCirculoBandeira;

//Canais do texto da bandeira
int RedTextoBandeira;
int GreenTextoBandeira;
int BlueTextoBandeira;

void draw(){
  // -----------------------------------------------------------------------------------------------------
  // --------------------------------------------- Opção 1 -----------------------------------------------
  // -----------------------------------------------------------------------------------------------------
  
  //Canais do fundo da bandeira
    RedFundoBandeira = 0;
    GreenFundoBandeira = 150;
    BlueFundoBandeira = 0;
    
    //Canais do losango da bandeira
    RedLosangoBandeira = 255;
    GreenLosangoBandeira = 255;
    BlueLosangoBandeira = 0;
    
    //Canais do circulo da bandeira
    RedCirculoBandeira = 0;
    GreenCirculoBandeira = 0;
    BlueCirculoBandeira = 100;
    
    //Canais do texto da bandeira
    RedTextoBandeira = 255;
    GreenTextoBandeira = 255;
    BlueTextoBandeira = 0;
  
  if(mousePressed == false){
    
    stroke(255);
    strokeWeight(borda);
    fill(RedFundoBandeira,GreenFundoBandeira,BlueFundoBandeira);
    rect(0+borda,0+borda,larguraBandeira,alturaBandeira);
    
    strokeWeight(0);
    fill(RedLosangoBandeira,GreenLosangoBandeira,BlueLosangoBandeira);
    quad(larguraBandeira/8, alturaBandeira/2, larguraBandeira/2, alturaBandeira/8, 7*larguraBandeira/8, alturaBandeira/2, larguraBandeira/2, 7*alturaBandeira/8);
    
    fill(RedCirculoBandeira,GreenCirculoBandeira,BlueCirculoBandeira);
    circle(larguraBandeira/2,alturaBandeira/2,larguraBandeira/3);
    
    fill(RedTextoBandeira,GreenTextoBandeira,BlueTextoBandeira);
    textFont(f,20);
    textAlign(CENTER);
    text("Ordem e Progresso",larguraBandeira/2,alturaBandeira/2);
    
    saveFrame("BandeiraOriginal.png");
    
    if ((keyPressed == true) && ((key == 't') || (key == 'T'))) {

        // -----------------------------------------------------------------------------------------------------
        // --------------------------------------------- Opção 4 -----------------------------------------------
        // -----------------------------------------------------------------------------------------------------
        
        int transparency = 64;
        float raio = larguraBandeira/3;
      
        stroke(255);
        strokeWeight(borda);
        fill(RedFundoBandeira,GreenFundoBandeira,BlueFundoBandeira);
        rect(0+borda,0+borda,larguraBandeira,alturaBandeira);
        
        strokeWeight(0);
        fill(RedLosangoBandeira,GreenLosangoBandeira,BlueLosangoBandeira);
        quad(larguraBandeira/8, alturaBandeira/2, larguraBandeira/2, alturaBandeira/8, 7*larguraBandeira/8, alturaBandeira/2, larguraBandeira/2, 7*alturaBandeira/8);
        
        fill(RedCirculoBandeira,GreenCirculoBandeira,BlueCirculoBandeira, transparency);
        circle(larguraBandeira/2,alturaBandeira/2,raio);
        transparency *= 2;
        raio /= 2;
        fill(RedCirculoBandeira,GreenCirculoBandeira,BlueCirculoBandeira, transparency);
        circle(larguraBandeira/2,alturaBandeira/2,raio);
        transparency *= 2;
        raio /= 2;
        fill(RedCirculoBandeira,GreenCirculoBandeira,BlueCirculoBandeira, transparency);
        circle(larguraBandeira/2,alturaBandeira/2,raio);
        
        fill(RedTextoBandeira,GreenTextoBandeira,BlueTextoBandeira);
        textFont(f,20);
        textAlign(CENTER);
        text("Ordem\n e \nProgresso",larguraBandeira/2,alturaBandeira/2-30);
        
        saveFrame("BandeiraTransparencia.png");
      }
 
  }else{
     
    // -----------------------------------------------------------------------------------------------------
    // --------------------------------------------- Opção 2 -----------------------------------------------
    // -----------------------------------------------------------------------------------------------------
  
      if(mouseButton == LEFT){
        //Canais do fundo da bandeira
        RedFundoBandeira = 255 - RedFundoBandeira;
        GreenFundoBandeira = 255 - GreenFundoBandeira;
        BlueFundoBandeira = 255 - BlueFundoBandeira;
        
        //Canais do losango da bandeira
        RedLosangoBandeira = 255 - RedLosangoBandeira;
        GreenLosangoBandeira = 255 - GreenLosangoBandeira;
        BlueLosangoBandeira = 255 - BlueLosangoBandeira;
        
        //Canais do circulo da bandeira
        RedCirculoBandeira = 255 - RedCirculoBandeira;
        GreenCirculoBandeira = 255 - GreenCirculoBandeira;
        BlueCirculoBandeira = 255 - BlueCirculoBandeira;
        
        //Canais do texto da bandeira
        RedTextoBandeira = 255 - RedTextoBandeira;
        GreenTextoBandeira = 255 - GreenTextoBandeira;
        BlueTextoBandeira = 255 - BlueTextoBandeira;
        
        stroke(255);
        strokeWeight(borda);
        fill(RedFundoBandeira,GreenFundoBandeira,BlueFundoBandeira);
        rect(0+borda,0+borda,larguraBandeira,alturaBandeira);
        
        strokeWeight(0);
        fill(RedLosangoBandeira,GreenLosangoBandeira,BlueLosangoBandeira);
        quad(larguraBandeira/8, alturaBandeira/2, larguraBandeira/2, alturaBandeira/8, 7*larguraBandeira/8, alturaBandeira/2, larguraBandeira/2, 7*alturaBandeira/8);
        
        fill(RedCirculoBandeira,GreenCirculoBandeira,BlueCirculoBandeira);
        circle(larguraBandeira/2,alturaBandeira/2,larguraBandeira/3);
        
        fill(RedTextoBandeira,GreenTextoBandeira,BlueTextoBandeira);
        textFont(f,20);
        textAlign(CENTER);
        text("Ordem e Progresso",larguraBandeira/2,alturaBandeira/2);
        
        saveFrame("BandeiraInvertida.png");
      }
      
      if(mouseButton == RIGHT){
        
          // -----------------------------------------------------------------------------------------------------
          // --------------------------------------------- Opção 3 -----------------------------------------------
          // -----------------------------------------------------------------------------------------------------
          float deslocamento = larguraBandeira/8;
          
          stroke(255);
          strokeWeight(borda);
          fill(RedFundoBandeira,GreenFundoBandeira,BlueFundoBandeira);
          rect(0+borda,0+borda,larguraBandeira,alturaBandeira);
          
          strokeWeight(0);
          fill(RedLosangoBandeira,GreenLosangoBandeira,BlueLosangoBandeira);
          quad(larguraBandeira/8 + deslocamento, alturaBandeira/2, 
               larguraBandeira/2 + deslocamento, alturaBandeira/8, 
               7*larguraBandeira/8 + deslocamento, alturaBandeira/2, 
               larguraBandeira/2 + deslocamento, 7*alturaBandeira/8);
          
          fill(RedCirculoBandeira,GreenCirculoBandeira,BlueCirculoBandeira);
          circle(larguraBandeira/2 + deslocamento,alturaBandeira/2,larguraBandeira/3);
          
          fill(RedTextoBandeira,GreenTextoBandeira,BlueTextoBandeira);
          textFont(f,20);
          textAlign(CENTER);
          text("Ordem e Progresso",larguraBandeira/2 + deslocamento,alturaBandeira/2);
          
          saveFrame("BandeiraDeslocada.png");
      }
  }
  
}
