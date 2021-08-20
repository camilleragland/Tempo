

void episode1() {
  background(0);
  textFont(dialogueFont);
  textSize(84);
  fill(255);

  PImage alarmClock;
  alarmClock = loadImage ("alarmClock.png");
  image(alarmClock, displayWidth/2 - 300, displayHeight/2 - 100, 600, 600);

  image(textBox, displayWidth/2, displayHeight/2 + 250, displayWidth, 800);

  String dialogue = "Beep Beep Beep Beep Beep Beep";
  textAnimation(dialogue);
}
