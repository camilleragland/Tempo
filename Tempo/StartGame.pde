
void scene1() {

  background(0);
  textFont(dialogueFont);
  textSize(84);
  fill(255);
  image(textBox, displayWidth/2, displayHeight/2 + 250, displayWidth, 800);

  String dialogue = "Beep Beep! Beep Beep! Beep Beep!";
  textAnimation(dialogue);

  alarmClock();
}

void scene1Finished() {
  background(0);

  textFont(dialogueFont);
  textSize(84);
  fill(255);
  image(textBox, displayWidth/2, displayHeight/2 + 250, displayWidth, 800);

  String dialogue1 = "Beep Beep! Beep Beep! Beep Beep!";
  text(dialogue1, displayWidth/2 - 650, displayHeight/2 + 250);

  PImage alarmClock;
  alarmClock = loadImage ("alarmClock.png");
  image(alarmClock, displayWidth/2 - 250, displayHeight/2 - 100, 600, 600);
}

void alarmClock() {

  //shakes alarm clock
  float deg = 90.0;
  float rad = radians (deg);
  float angle = rad;
  float jitter;

  if (second() % 2 == 0) {  
    jitter = random (-0.1, 0.1);
    angle = angle + jitter;
  }

  float c = cos(angle);
  rotate(c); 

  PImage alarmClock;
  alarmClock = loadImage ("alarmClock.png");
  image(alarmClock, displayWidth/2 - 250, displayHeight/2 - 200, 600, 600);
}
