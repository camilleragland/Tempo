void options() {
  background (0);
  
  textSize(optionsFontSize);
  textFont(optionsFont);
  text("Sound", displayWidth/2-400, displayHeight/2-200);
  
  //on button restarts and turns music back on
  image(onButton, displayWidth/2-270, displayHeight/2-150, 300, 300);
  if ((state == "options") && (((mouseX < (displayWidth/2)-160)) && (mouseX > (displayWidth/2)-375)) && ((mouseY < ((displayHeight/2)-100)) && (mouseY > ((displayHeight/2)-160)))) {
    image(onPressed, displayWidth/2-270, displayHeight/2-100, 300, 300);
      if ((state == "options") && (mousePressed) && (((mouseX < (displayWidth/2)-160)) && (mouseX > (width/2)-375)) && ((mouseY < ((displayHeight/2)-100)) && (mouseY > ((displayHeight/2)-160)))){
          playMusic = true;
          playTitleSong();
      }
      
  }
  
  //off button turns off music
  image(offButton, displayWidth/2, displayHeight/2-150, 300, 300);
   if ((state == "options") && (((mouseX < (width/2)+120)) && (mouseX > (displayWidth/2)-120)) && ((mouseY < ((displayHeight/2)-100)) && (mouseY > ((displayHeight/2)-160)))) {
    image(offPressed, displayWidth/2, displayHeight/2-100, 300, 300);
      if ((state == "options") && (mousePressed) && (((mouseX < (displayWidth/2)+120)) &&(mouseX > (displayWidth/2)-120))&& ((mouseY < ((displayHeight/2)-100)) && (mouseY > ((displayHeight/2)-160)))) {
        playMusic = false;
        playTitleSong();
      }
  }
  
   //back button
  image(backButton, displayWidth/2-600, displayHeight/2-400, 100, 100);
  //takes back to title screen
  if ((state == "options") && (((mouseX < (displayWidth/2)-575)) &&(mouseX > (displayWidth/2)-640))&& ((mouseY < ((displayHeight/2)-375)) && (mouseY > ((displayHeight/2)-430)))) {
    image(backPressed, displayWidth/2-600, displayHeight/2-400, 100, 100);
    if ((state == "options") && (mousePressed) && (((mouseX < (displayWidth/2)-575)) &&(mouseX > (displayWidth/2)-640))&& ((mouseY < ((displayHeight/2)-375)) && (mouseY > ((displayHeight/2)-430)))) {
      state = "title";
      
    }
  }
  
}
