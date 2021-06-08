import processing.video.*;
import processing.sound.*;
import lord_of_galaxy.timing_utils.*;

//title data
SoundFile titleMusic;
Movie pretitleScreen;
String state = "pretitle"; 

PFont titleFont;
PFont optionsFont;

PImage startButton;
PImage startPressed;
PImage optionsButton;
PImage optionsPressed;
PImage quitButton;
PImage quitPressed;

PImage backButton;
PImage backPressed;

PImage sliderBar;
PImage sliderButton;


int fourMinutes = 150000;
Stopwatch titleWatch;
//title data ends

void setup() {
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
  
  sliderBar = loadImage("sliderBar.png");
  sliderButton = loadImage("sliderButton.png");

  //timer to go back to the pretitle video
  titleWatch = new Stopwatch(this);
  titleWatch.start();
  
  optionsFont = createFont("font.TTF", 100, true);
}

void draw() {
  if (state=="pretitle") { //pretitle state
    pretitleScreen.play();

    imageMode(CENTER);
    image(pretitleScreen, width/2, height/2, width, height );

    if (pretitleScreen.time() >= pretitleScreen.duration() || mousePressed) { 
      //sees if the video has stopped and goes to next state
      pretitleScreen.stop();
      state = "title";
      titleWatch.restart();
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
  textSize(600);
  textFont(titleFont);
  text("Tempo", width/2-400, height/2-200);

  image(startButton, width/2, height/2 + 100, 400, 400);
  if ((mouseX < ((width/2)+150) && mouseX > (width/2-150)) &&(mouseY < ((height/2)+150) && mouseY > ((height/2)+45))) {
    image(startPressed, width/2, height/2+80, 400, 400);
    //if start is pressed goes to save data
    if ( (state == "title") && (mousePressed)&& ((mouseX < ((width/2)+150) && mouseX > (width/2-150)) &&(mouseY < ((height/2)+150) && mouseY > ((height/2)+45))) ) {
      state = "load game";
    }
  }

  image(optionsButton, width/2, height/2 + 225, 400, 400);
  if ((mouseX < ((width/2)+150) && mouseX > (width/2-150))&& ((mouseY < ((height/2)+280) && mouseY > ((height/2)+175)))) {
    image(optionsPressed, width/2, height/2-10 + 225, 400, 400);
    //if options is pressed goes to ptions menu
    if ( (state == "title") &&  ( mousePressed )&& ((mouseX < ((width/2)+150) && mouseX > (width/2-150))&& ((mouseY < ((height/2)+280) && mouseY > ((height/2)+175)))) ) {
      state = "options";
    }
  }

  image(quitButton, width/2, height/2 + 350, 400, 400);
  if ((mouseX < ((width/2)+150) && mouseX > (width/2-150))&& ((mouseY < ((height/2)+410) && mouseY > ((height/2)+300)))) {
    image(quitPressed, width/2, height/2+340, 400, 400);
    //if quit is presed ends game
    if ((state == "title") && (mousePressed) && ((mouseX < ((width/2)+150) && mouseX > (width/2-150))&& ((mouseY < ((height/2)+410) && mouseY > ((height/2)+300)))) ) {
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
  titleMusic.loop();
}

//stops title music
void stopTitleSong() {
  titleMusic.stop();
}

//reads the minutes on the title movie
void movieEvent(Movie pretitleScreen) {
  pretitleScreen.read();
}
