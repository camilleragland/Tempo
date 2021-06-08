void options() {
  background (0);
  image(backButton, width/2-600, height/2-400, 100, 100);
  //takes back to title screen
  if ((state == "options") && (((mouseX < (width/2)-575)) &&(mouseX > (width/2)-640))&& ((mouseY < ((height/2)-375)) && (mouseY > ((height/2)-430)))) {
    image(backPressed, width/2-600, height/2-400, 100, 100);
    if ((state == "options") && (mousePressed) && (((mouseX < (width/2)-575)) &&(mouseX > (width/2)-640))&& ((mouseY < ((height/2)-375)) && (mouseY > ((height/2)-430))))  {
      state = "title";
    }
  }
}
