import processing.video.*;
import processing.sound.*;

SoundFile titleMusic;
Movie titleScreen;
String state = "pretitle"; 
PFont font;

void setup() {
   fullScreen();
  imageMode(CENTER);
  titleScreen = new Movie( this, "titleScreen.mov");
  titleScreen.play();
  titleMusic = new SoundFile (this, "title.wav");
  titleMusic.amp(0.3);
  font = createFont("font.TTF", 300,true);
  
}

void draw(){
  if (state=="pretitle") {
  imageMode(CENTER);
  image(titleScreen, width/2, height/2, width, height );
  
    if (titleScreen.time() >= titleScreen.duration()){
      state = "title";
      playTitle();
    }
    
  }
  if (state == "title"){
   title();
  }
  
    
}

void title(){
  fill(204, 153, 255);
  textSize(600);
  textFont(font);
  text("Tempo",width/2-400, height/2-200);
}

void playTitle(){
titleMusic.play();
titleMusic.loop();
}

void movieEvent(Movie titleScreen){
  titleScreen.read();
}
