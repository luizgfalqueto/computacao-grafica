
float s = second();
float m = minute();
float h = hour();

float centerX=250;
float centerY=250;
float raio=150;
float comprimentoPonteiro = raio/15;

float anguloSegundoInicial =(float)(-Math.PI/2);
float anguloMinutoInicial = (float)(-Math.PI/2);
float anguloHoraInicial = (float)(-Math.PI/2);
float anguloSegundo = (float)(anguloSegundoInicial + (s * Math.PI/30));
float anguloMinuto = (float)(anguloMinutoInicial + (m * Math.PI/30));
float anguloHora = (float)(anguloHoraInicial + (h * Math.PI/30));

float velocidadeAngularSegundo = (float)(Math.PI/30)/60;
float velocidadeAngularMinuto = velocidadeAngularSegundo/60;
float velocidadeAngularHora = (float)(Math.PI/21600)/60;

void setup(){
  size(500,500);
}

void draw(){
  circle(centerX,centerY,300);
  
  //ponteiro dos segundos
  line(centerX,centerY,centerX + (float)((comprimentoPonteiro*14.5)*Math.cos(anguloSegundo)),centerY + (float)((comprimentoPonteiro*14.5)*Math.sin(anguloSegundo)));
  anguloSegundo += velocidadeAngularSegundo;
  
  strokeWeight(2);
  
  //ponteiro dos minutos
  line(centerX,centerY,centerX + (float)((comprimentoPonteiro*14)*Math.cos(anguloMinuto)),centerY + (float)((comprimentoPonteiro*14)*Math.sin(anguloMinuto)));
  anguloMinuto += velocidadeAngularMinuto;
  
  strokeWeight(3);
  
  //ponteiro das horas
  line(centerX,centerY,centerX + (float)((comprimentoPonteiro*13)*Math.cos(anguloHora)),centerY + (float)((comprimentoPonteiro*13)*Math.sin(anguloHora)));
  anguloHora += velocidadeAngularHora;
  
  strokeWeight(1);
}  
