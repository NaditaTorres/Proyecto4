//----------------------Variables
int pantalla=0;
PFont font1;
PImage f1;
PImage cara;
PImage marco;

//------------------Librerías de video (para función de webcam)
import gab.opencv.*;
import processing.video.*;
import java.awt.*;
Capture video;
OpenCV opencv;

//----------------------Libreria de audio
import processing.sound.*;
SoundFile file;


void setup() {
  size(640, 480);
  file = new SoundFile(this, "grito.mp3");
  file.play();
  cara = loadImage("cara.png");
  marco = loadImage("marco.png");
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
}

   
void draw (){
  switch (pantalla){
  
    case 0: //---------Pantalla Inicio
        
  f1 = loadImage("fondo.jpg");
  image(f1 , 0 , 0);
  
  font1 = loadFont ("ComicSansMS-Bold-48.vlw");
   textFont (font1, 60);
     fill(random(136,140),random(90,109),random(169,98));
     text("Grita con Edvard!",80,220);
     
   textFont (font1, 35);
     fill(255,255,255);
     text("Presiona ENTER para continuar", 70,330);
    
    
       if (keyPressed){
       if (key==ENTER);
       pantalla = 1;
      
}
break;

     case 1://----------Pantalla indicaciones
    
  f1 = loadImage("fondo.jpg");
  image(f1 , 0 , 0);
  
  font1 = loadFont ("ComicSansMS-Bold-48.vlw");
   textFont (font1, 35);
     fill(#001650);
     text("¡Serás el protagonista de", 120,130);
     
     font1 = loadFont ("ComicSansMS-Bold-48.vlw");
   textFont (font1, 35);
     fill(#001650);
     text("la famosa pintura",180,170);
     
     font1 = loadFont ("ComicSansMS-Bold-48.vlw");
   textFont (font1, 40);
     fill(random(136,140),random(90,109),random(169,98));
     text("El grito de Edvard Munch!",80,220);
    
   textFont (font1, 40);
     fill(255,255,255);
     text("INSTRUCCIONES:", 150,300);
     
   textFont (font1, 25);
     fill(255,255,255);
     text("Para comenzar da Click", 190,350);
    
     textFont (font1, 25);
     fill(255,255,255);
     text("Para regresar a inicio presiona BACKSPACE", 70,390);
    
   if (mousePressed){
       pantalla = 2;
      }
      
      
break;

     case 2://--------------------Pantalla Filtro

  scale(2);
  opencv.loadImage(video);

  image(video, 0, 0 );

  fill(0);
  noStroke();
  //strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    image(cara,faces[i].x+faces[i].width/-3, faces[i].y+faces[i].height*-0.2, faces[i].width*1.7, faces[i].height*1.7);
     image(marco,faces[i].x+faces[i].width/-1., faces[i].y+faces[i].height*-0.4, faces[i].width*3, faces[i].height*2);
  }
  
   if (keyPressed){
       if (key==BACKSPACE);
       pantalla = 0;
}
  
  
  
}//SWITCH
}
void captureEvent(Capture c) {
  c.read();
}