
float s = second()+2;
float m = minute();
float h = hour();

float cont = s;

float centerX=300;
float centerY=400;
float raio=140;
float raioRelogio = 300;
float comprimentoPonteiro = raio/15;
float comprimentoPendulo = raio+250;

float comprimentoBase = 208;

float raioPontosMaiores = 140;
float raioPontosMenores = 100;
float raioCirculoCentral = 17;
float raioNumeros = 115;

float anguloSegundoInicial =(float)(-Math.PI/2);
float anguloMinutoInicial = (float)(-Math.PI/2);
float anguloHoraInicial = (float)(-Math.PI/2);

float anguloSegundo = (float)(anguloSegundoInicial + (s * Math.PI/30));
float anguloMinuto = (float)(anguloMinutoInicial + (m * Math.PI/30));
float anguloHora = (float)(anguloMinuto + radians((60*h-11*m)/2));

float velocidadeAngularSegundo = (float)(Math.PI/30);
float velocidadeAngularMinuto = velocidadeAngularSegundo/60;
float velocidadeAngularHora = (float)(Math.PI/21600);

PFont f;

void setup(){
  size(600,700);
  background(255);
  frameRate(1);
  f = createFont("Arial",16,true);
}

void draw(){
  
  //Atualizando relógio a cada 5 minutos
  if(cont%305==0){
    s = second()+1;
    m = minute();
    h = hour();
    
    anguloSegundoInicial =(float)(-Math.PI/2);
    anguloMinutoInicial = (float)(-Math.PI/2);
    anguloHoraInicial = (float)(-Math.PI/2);
    
    anguloSegundo = (float)(anguloSegundoInicial + (s * Math.PI/30));
    anguloMinuto = (float)(anguloMinutoInicial + (m * Math.PI/30));
    anguloHora = (float)(anguloMinuto + radians((60*h-11*m)/2));
    
    velocidadeAngularSegundo = (float)(Math.PI/30);
    velocidadeAngularMinuto = velocidadeAngularSegundo/60;
    velocidadeAngularHora = (float)(Math.PI/21600);
  }
  cont++;
  
  strokeWeight(0);
  fill(140, 140, 140);
  rect(0,0,width,height);
  
  strokeWeight(1);
  
  fill(110,110,110);
  circle(centerX,centerY,raioRelogio+15);
  
  fill(255);
  circle(centerX,centerY,raioRelogio);
  
  strokeWeight(2);
  //ponteiro dos segundos
  line(centerX,centerY,centerX + (float)((comprimentoPonteiro*14.5)*Math.cos(anguloSegundo)),centerY + (float)((comprimentoPonteiro*14.5)*Math.sin(anguloSegundo)));
  anguloSegundo += velocidadeAngularSegundo;
  
  fill(0);
  circle(centerX,centerY,raioCirculoCentral);
  
  strokeWeight(4);
  
  //ponteiro dos minutos
  line(centerX,centerY,centerX + (float)((comprimentoPonteiro*14)*Math.cos(anguloMinuto)),centerY + (float)((comprimentoPonteiro*14)*Math.sin(anguloMinuto)));
  anguloMinuto += velocidadeAngularMinuto;
  
  strokeWeight(7);
  
  //ponteiro das horas
  line(centerX,centerY,centerX + (float)((comprimentoPonteiro*11)*Math.cos(anguloHora)),centerY + (float)((comprimentoPonteiro*11)*Math.sin(anguloHora)));
  anguloHora += velocidadeAngularHora;
  
  strokeWeight(1);
  
  //desenhando as marcações do relógio
  float angle,x,y,w,z;
  beginShape(POINTS);
  for (int i = 0; i < 360; i+=6) {
    
    angle = (float) (radians(i));
    //angulos pontos maiores
    x = (float)(centerX + Math.cos(angle) * raioPontosMaiores);
    y = (float)(centerY + Math.sin(angle) * raioPontosMaiores);
    //angulos pontos menores
    w = (float)(centerX + Math.cos(angle) * raioPontosMenores);
    z = (float)(centerY + Math.sin(angle) * raioPontosMenores);
    
    if(i%5==0){
      strokeWeight(4);
    }else{
      strokeWeight(2);
    }
    vertex(x, y);
    vertex(w,z);
  }
  endShape();
  
  //numeros do relógio
  float a,b;
  angle = (float)(-Math.PI/3);
  
  for(int j=1; j<13 ; j++){
    
    a = (float)(centerX + Math.cos(angle) * raioNumeros);
    b = (float)(centerY + 8 + Math.sin(angle) * raioNumeros);
    
    if(j==3){
      textFont(f,30);
      textAlign(LEFT);
      a = (float)(centerX - 5 + Math.cos(angle) * raioNumeros);
      text(j,a,b);
    }else{
      if(j==6){
        textFont(f,30);
        textAlign(CENTER);
        b = (float)(centerY + 15 + Math.sin(angle) * raioNumeros);
        text(j,a,b);
      }else{
        if(j==9){
          textFont(f,30);
          textAlign(CENTER);
          a = (float)(centerX - 5 + Math.cos(angle) * raioNumeros);
          text(j,a,b);
        }else{
          if(j==12){
            textFont(f,30);
            textAlign(CENTER);
            text(j,a,b);
          }
        }
      }
    }
    
    angle += (float)Math.PI/6;
  }
  
  textFont(f,12);
  text("kUaRtZ",centerX,centerY+75);
  
  //Bases do relógio
  strokeWeight(1);
  //Base esquerda
  fill(110,110,110);
  triangle(centerX + (comprimentoBase-50)*cos(-PI*4/3),centerY + (comprimentoBase-50)*sin(-PI*4/3),
  centerX + (comprimentoBase-50)*cos(-PI*7/5),centerY + (comprimentoBase-50)*sin(-PI*7/5),
  centerX + (comprimentoBase)*cos(-PI*41/30),centerY + (comprimentoBase)*sin(-PI*41/30));
  circle(centerX + (comprimentoBase)*cos(-PI*41/30),centerY + (comprimentoBase)*sin(-PI*41/30),15);
  
  //Base direita
  triangle(centerX + (comprimentoBase-50)*cos(-PI*4/3-PI*8/30),centerY + (comprimentoBase-50)*sin(-PI*4/3-PI*8/30),
  centerX + (comprimentoBase-50)*cos(-PI*7/5-PI*8/30),centerY + (comprimentoBase-50)*sin(-PI*7/5-PI*8/30),
  centerX + (comprimentoBase)*cos(-PI*41/30-PI*8/30),centerY + (comprimentoBase)*sin(-PI*41/30-PI*8/30));
  circle(centerX + (comprimentoBase)*cos(-PI*41/30-PI*8/30),centerY + (comprimentoBase)*sin(-PI*41/30-PI*8/30),15);
}  
