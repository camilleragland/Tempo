  ControlP5 cp5;

void optionsSetup() {
  //slider creation
  cp5 = new ControlP5(this);
  cp5.addSlider("volumeSlider")
    .setImage(sliderBar)
    .setRange(0, 100)
    .setPosition((width/2)-400, (height/2)-300);

  //creates master sound obj.
  Sound gameVolume;
  gameVolume = new Sound(this);
}

void options() {
  background (0);

  image(backButton, width/2-600, height/2-400, 100, 100);
  //takes back to title screen
  if ((state == "options") && (((mouseX < (width/2)-575)) &&(mouseX > (width/2)-640))&& ((mouseY < ((height/2)-375)) && (mouseY > ((height/2)-430)))) {
    image(backPressed, width/2-600, height/2-400, 100, 100);
    if ((state == "options") && (mousePressed) && (((mouseX < (width/2)-575)) &&(mouseX > (width/2)-640))&& ((mouseY < ((height/2)-375)) && (mouseY > ((height/2)-430)))) {
      state = "title";
      cp5.remove("volumeSlider");
    }
  }

  //slider for music 
  textFont(optionsFont);
  textSize(85);
  text("Sound", width/2-400, height/2-300);
}

void volumeSlider(float val) {
  println("a slider event: " +val);
}
