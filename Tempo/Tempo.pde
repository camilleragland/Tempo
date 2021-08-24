import processing.video.*;
import processing.sound.*;
import lord_of_galaxy.timing_utils.*;
import controlP5.*;

//title data
SoundFile titleMusic;
Movie pretitleScreen;
boolean playMusic = true;

public enum gameState {
  TITLE_STATE, 
    EXIT_STATE, 
    PRETITLE_STATE, 
    OPTIONS_STATE, 
    E1_S1, 
    E1_S1F
};

//int pretitle_state = 0;
//int title_state = 1;
//int start_state = 2;
//int options_state = 3;
//int exit_state = 4;
gameState state = gameState.PRETITLE_STATE; 


PFont titleFont;
float titleFontSize = (displayWidth * displayHeight) + 0.75;
PFont optionsFont;
float optionsFontSize = (displayWidth * displayHeight) + 0.50 ;
PFont dialogueFont;

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

PImage textBox;
int count = 0;
String dialogue;



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

  textBox = loadImage ("textBox.png");

  //timer to go back to the pretitle video
  titleWatch = new Stopwatch(this);
  titleWatch.start();

  optionsFont = createFont("font.TTF", 100, true);
  dialogueFont = createFont("dialogueFont.TTF", 100, true);

  if (state == gameState.OPTIONS_STATE) {
  }
}

void draw() {
  println ("the state is " + state);
  if (state == gameState.PRETITLE_STATE) { //pretitle state
    pretitleScreen.play();

    imageMode(CENTER);
    image(pretitleScreen, displayWidth/2, displayHeight/2, displayWidth, displayHeight );
    if (pretitleScreen.time() >= pretitleScreen.duration()) {
      state = gameState.TITLE_STATE;
      //if in pretitle state, if clicked goes to title
      pretitleScreen.stop();
      titleWatch.restart();
      playMusic = true;
      playTitleSong();
    }
  } else if (state == gameState.TITLE_STATE) {

    title();
  } else if (state == gameState.OPTIONS_STATE) {
    options();
  } else if (state == gameState.TITLE_STATE) {
    episode1();
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
  }

  image(optionsButton, displayWidth/2, displayHeight/2 + 225, 400, 400);
  if ((mouseX < ((displayWidth/2)+150) && mouseX > (displayWidth/2-150))&& ((mouseY < ((displayHeight/2)+280) && mouseY > ((displayHeight/2)+175)))) {
    image(optionsPressed, displayWidth/2, displayHeight/2-10 + 225, 400, 400);
  }

  image(quitButton, displayWidth/2, displayHeight/2 + 350, 400, 400);
  if ((mouseX < ((displayWidth/2)+150) && mouseX > (displayWidth/2-150))&& ((mouseY < ((displayHeight/2)+410) && mouseY > ((displayHeight/2)+300)))) {
    image(quitPressed, displayWidth/2, displayHeight/2+340, 400, 400);
  }

  if (titleWatch.time() >= fourMinutes) { //if title stopwatch gets to time goes to Pretitle
    state = gameState.PRETITLE_STATE;
    stopTitleSong();
  }
}


//plays title music
void playTitleSong() {
  if (playMusic == true) {
    titleMusic.loop();
  } else if (playMusic == false) {
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

//will typewrite the text
void textAnimation (String dialogue) {
  text(dialogue.substring(0, count), displayWidth/2 - 650, displayHeight/2 + 250);
  if (count < dialogue.length()) {
    count++;
  }
}

//mouse clicked events
void mouseClicked() {
  if (state == gameState.PRETITLE_STATE) {
    state = gameState.TITLE_STATE;
    //if in pretitle state, if clicked goes to title
    pretitleScreen.stop();
    titleWatch.restart();
    playMusic = true;
    playTitleSong();
  } else if (state == gameState.TITLE_STATE) {
    //if start is pressed goes to start game
    if ((mouseX < ((displayWidth/2)+150) && mouseX > (displayWidth/2-150)) &&(mouseY < ((displayHeight/2)+150) && mouseY > ((displayHeight/2)+45))) {
      state = gameState.E1_S1;
    }
    //if options is pressed goes to options menu
    if ((mouseX < ((displayWidth/2)+150) && mouseX > (displayWidth/2-150))&& ((mouseY < ((displayHeight/2)+280) && mouseY > ((displayHeight/2)+175)))) {
      state = gameState.OPTIONS_STATE;
    }
    //exits out
    if (((mouseX < ((displayWidth/2)+150) && mouseX > (displayWidth/2-150))&& ((mouseY < ((displayHeight/2)+410) && mouseY > ((displayHeight/2)+300)))) ) {
      exit();
    }
  } else  if (state == gameState.E1_S1) {
    episode1();
    println ("the state is " + state);
  } else if (state == gameState.E1_S1) {
    scene1Finished();
  }
}
