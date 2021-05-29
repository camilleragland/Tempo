import processing.video.*;
import processing.sound.*;

SoundFile titleMusic;
Movie titleScreen;
String state = "pretitle"; 
PFont font;

int savedTime;
int totalTime = 60000;


void setup() {
   fullScreen();
  imageMode(CENTER);
  titleScreen = new Movie( this, "titleScreen.mov");
  titleScreen.play();
  titleMusic = new SoundFile (this, "title.wav");
  titleMusic.amp(0.3);
  font = createFont("font.TTF", 300,true);
  
  savedTime = millis();
}

void draw(){
  if (state=="pretitle") {
  
  imageMode(CENTER);
  image(titleScreen, width/2, height/2, width, height );
    if(mousePressed){
     titleScreen.stop();
     titleScreen.jump(0.0);
     state = "title";
     savedTime = 0;
    }
    
    if (titleScreen.time() >= titleScreen.duration()){
      
      playTitle();
      
    }
    
  }
  if (state == "title"){
   savedTime = 0;
   title();
  }
  if (state == "options"){
   options();
   
  }
    
}

void title(){
  savedTime = 0;
  background (0);
  fill(204, 153, 255);
  textSize(600);
  textFont(font);
  text("Tempo",width/2-400, height/2-200);
  
  int titleTime = millis() - savedTime;
    if (titleTime > totalTime){
     state = "pretitle";
     titleScreen.play();
     savedTime = 0;
  }
}

void playTitle(){
titleMusic.play();
titleMusic.loop();
}

void movieEvent(Movie titleScreen){
  titleScreen.read();
}
