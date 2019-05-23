class Button {

  float buttonX;
  float buttonY;
  float buttonSize;
  String buttonValue;

  color buttonColour;
  color buttonValueColour;
  color buttonHoverColour;

  Button(float buttonX, float buttonY, float buttonSize, String buttonValue) {

    this.buttonX = buttonX;
    this.buttonY = buttonY;
    this.buttonSize = buttonSize;
    this.buttonValue = buttonValue;

    this.buttonColour = color(50, 55, 100);
    this.buttonValueColour = color(204, 102, 0);
    this.buttonHoverColour = color(255, 0, 0);
  }

  void draw() {

    ellipse(this.buttonX, this.buttonY, this.buttonSize, this.buttonSize);
    stroke(204, 102, 0);
    fill(this.buttonColour);

    textAlign(CENTER, CENTER);
    text(this.buttonValue, this.buttonX, this.buttonY);
    fill(this.buttonValueColour);
  }

  void hover() {

    float distance = dist(mouseX, mouseY, this.buttonX, this.buttonY);

    if (distance < this.buttonSize/2) {

      ellipse(this.buttonX, this.buttonY, this.buttonSize, this.buttonSize);
      stroke(204, 102, 0);

      textAlign(CENTER, CENTER);
      text(this.buttonValue, this.buttonX, this.buttonY);

      fill(this.buttonHoverColour);
    }
  }

  float getButtonX() {

    return this.buttonX;
  }



  float getButtonY() {

    return this.buttonY;
  }



  float getButtonRadius() {

    return (this.buttonSize)/2;
  }
}
