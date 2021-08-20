import processing.video.*;
import processing.sound.*;
import lord_of_galaxy.timing_utils.*;
import controlP5.*;

//title data
SoundFile titleMusic;
Movie pretitleScreen;
boolean playMusic = true;
String state = "pretitle"; 


PFont titleFont;
float titleFontSize = (displayWidth * displayHeight) + 0.75;
PFont optionsFont;
float optionsFontSize = (displayWidth * displayHeight) + 0.50 ;

PImage startButton;
PImage startPressed;
PImage optionsButton;
PImage optionsPressed;
PImage quitButton;
PImage quitPressed;

PImage backButton;
PImage backPressed;

PImage onButton;
PImage onPressed;
PImage offButton;
PImage offPressed;

PImage windowButton;
PImage windowPressed;
PImage fullButton;
PImage fullPressed;

int fourMinutes = 150000;
Stopwatch titleWatch;
//title data ends

void setup() {
  surface.setResizable(true);
  fullScreen();
  imageMode(CENTER);
  

  pretitleScreen = new Movie( this, "titleScreen.mov");

  titleMusic = new SoundFile (this, "title.wav");
  titleMusic.amp(0.3);
  titleFont = createFont("font.TTF", 300, true);

  startButton = loadImage("startButton.png");
  startPressed = loadImage("startPressed.png");
  optionsButton = loadImage("optionsButton.png");
  optionsPressed = loadImage("optionsPressed.png");
  quitButton = loadImage("quitButton.png");
  quitPressed = loadImage("quitPressed.png");
  
  backButton = loadImage("backButton.png");
  backPressed = loadImage ("backPressed.png");
  
  onButton = loadImage ("onButton.png");
  onPressed = loadImage ("onPressed.png");
  offButton = loadImage ("offButton.png");
  offPressed = loadImage ("offPressed.png");
  
  fullButton = loadImage ("fullButton.png");
  fullPressed = loadImage ("fullPressed.png");
  windowButton = loadImage ("windowButton.png");
  windowPressed = loadImage ("windowPressed.png");

  //timer to go back to the pretitle video
  titleWatch = new Stopwatch(this);
  titleWatch.start();
  
  optionsFont = createFont("font.TTF", 100, true);
  if (state == "options"){
    
  }
}

void draw() {
  if (state=="pretitle") { //pretitle state
    pretitleScreen.play();

    imageMode(CENTER);
    image(pretitleScreen, displayWidth/2, displayHeight/2, displayWidth, displayHeight );

    if (pretitleScreen.time() >= pretitleScreen.duration() || mousePressed) { 
      //sees if the video has stopped and goes to next state
      pretitleScreen.stop();
      state = "title";
      titleWatch.restart();
      playMusic = true;
      playTitleSong();
    }
  }
  if (state == "title") {

    title();
  }

  if (state == "options") {
    options();
  }
  
}

//the title screen of the game
void title() {
  background (0);
  fill(204, 153, 255);
  textSize(titleFontSize);
  textFont(titleFont);
  text("Tempo", displayWidth/2-400, displayHeight/2-200);

  image(startButton, displayWidth/2, displayHeight/2 + 100, 400, 400);
  if ((mouseX < ((displayWidth/2)+150) && mouseX > (displayWidth/2-150)) &&(mouseY < ((displayHeight/2)+150) && mouseY > ((displayHeight/2)+45))) {
    image(startPressed, displayWidth/2, displayHeight/2+80, 400, 400);
    //if start is pressed goes to save data
    if ( (state == "title") && (mousePressed)&& ((mouseX < ((displayWidth/2)+150) && mouseX > (displayWidth/2-150)) &&(mouseY < ((displayHeight/2)+150) && mouseY > ((displayHeight/2)+45))) ) {
      state = "load game";
    }
  }

  image(optionsButton, displayWidth/2, displayHeight/2 + 225, 400, 400);
  if ((mouseX < ((displayWidth/2)+150) && mouseX > (displayWidth/2-150))&& ((mouseY < ((displayHeight/2)+280) && mouseY > ((displayHeight/2)+175)))) {
    image(optionsPressed, displayWidth/2, displayHeight/2-10 + 225, 400, 400);
    //if options is pressed goes to ptions menu
    if ( (state == "title") &&  ( mousePressed )&& ((mouseX < ((displayWidth/2)+150) && mouseX > (displayWidth/2-150))&& ((mouseY < ((displayHeight/2)+280) && mouseY > ((displayHeight/2)+175)))) ) {
      state = "options";
    }
  }

  image(quitButton, displayWidth/2, displayHeight/2 + 350, 400, 400);
  if ((mouseX < ((displayWidth/2)+150) && mouseX > (displayWidth/2-150))&& ((mouseY < ((displayHeight/2)+410) && mouseY > ((displayHeight/2)+300)))) {
    image(quitPressed, displayWidth/2, displayHeight/2+340, 400, 400);
    //if quit is presed ends game
    if ((state == "title") && (mousePressed) && ((mouseX < ((displayWidth/2)+150) && mouseX > (displayWidth/2-150))&& ((mouseY < ((displayHeight/2)+410) && mouseY > ((displayHeight/2)+300)))) ) {
      exit();
    }
  }

  if (titleWatch.time() >= fourMinutes) { //if title stopwatch gets to time goes to Pretitle
    state = "pretitle";
    stopTitleSong();
  }
}


//plays title music
void playTitleSong() {
  if (playMusic == true) {
  titleMusic.loop();
  }
  else if (playMusic == false){
  stopTitleSong();
  }
}

//stops title music
void stopTitleSong() {
  titleMusic.stop();
}

//reads the minutes on the title movie
void movieEvent(Movie pretitleScreen) {
  pretitleScreen.read();
}
