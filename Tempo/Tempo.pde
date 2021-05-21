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
  titleMusic = new SoundFile (this, "titleSong.wav");
  titleMusic.amp(0.2);
  font = createFont("font.TTF", 300,true);
}

void draw(){
  if (state=="pretitle") {
  imageMode(CENTER);
  image(titleScreen, width/2, height/2, 2000, 1100 );
  
    if (titleScreen.time() >= titleScreen.duration()){
      state = "title";
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
  text("Tempo",width/2-400, 300);
  titleMusic.play();
  
}
void movieEvent(Movie titleScreen){
  titleScreen.read();
}
