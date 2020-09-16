
float s = second();
float m = minute();
float h = hour();

float centerX=300;
float centerY=200;
float raio=100;
float raioRelogio = 230;
float comprimentoPonteiro = raio/15;
float comprimentoPendulo = raio+250;

float raioPontos = 100;

float anguloSegundoInicial =(float)(-Math.PI/2);
float anguloMinutoInicial = (float)(-Math.PI/2);
float anguloHoraInicial = (float)(-Math.PI/2);

float anguloSegundo = (float)(anguloSegundoInicial + (s * Math.PI/30));
float anguloMinuto = (float)(anguloMinutoInicial + (m * Math.PI/30));
float anguloHora = (float)(anguloMinuto + radians((60*h-11*m)/2));

float velocidadeAngularSegundo = (float)(Math.PI/30);
float velocidadeAngularMinuto = velocidadeAngularSegundo/60;
float velocidadeAngularHora = (float)(Math.PI/21600);


void setup(){
  size(600,700);
  background(255);
  frameRate(1);
}

void draw(){
  
  strokeWeight(0);
  fill(80);
  rect(0,0,width,height);
  
  strokeWeight(1);
  fill(#dddddd);
  circle(centerX,centerY,raioRelogio);
  
  //ponteiro dos segundos
  line(centerX,centerY,centerX + (float)((comprimentoPonteiro*14.5)*Math.cos(anguloSegundo)),centerY + (float)((comprimentoPonteiro*14.5)*Math.sin(anguloSegundo)));
  anguloSegundo += velocidadeAngularSegundo;
  
  strokeWeight(2);
  
  //ponteiro dos minutos
  line(centerX,centerY,centerX + (float)((comprimentoPonteiro*14)*Math.cos(anguloMinuto)),centerY + (float)((comprimentoPonteiro*14)*Math.sin(anguloMinuto)));
  anguloMinuto += velocidadeAngularMinuto;
  
  strokeWeight(4);
  
  //ponteiro das horas
  line(centerX,centerY,centerX + (float)((comprimentoPonteiro*11)*Math.cos(anguloHora)),centerY + (float)((comprimentoPonteiro*11)*Math.sin(anguloHora)));
  anguloHora += velocidadeAngularHora;
  
  strokeWeight(1);
  
  //desenhando as macações do relógio
  beginShape(POINTS);
  for (int i = 0; i < 360; i+=6) {
    if(i%5==0){
      strokeWeight(3);
    }else{
      strokeWeight(1);  
    }
    float angle = radians(i);
    float x = (float) (centerX + Math.cos(angle) * raioPontos);
    float y = (float)(centerY + Math.sin(angle) * raioPontos);
    vertex(x, y);
  }
  endShape();
}  
