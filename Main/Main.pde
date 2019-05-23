import http.requests.*;

PFont labelFont; 

PImage emptyCup;
PImage fullCup;
PImage free;

Button scanButton;
Button exitButton;
Decoder qrDecoder;
LoyaltyCard loyaltyCard;

boolean switchCamera;
boolean scanQR = true;


void setup() {

  size(650, 600);

  labelFont = createFont("Noteworthy-Bold-48.vlw", 24); 
  textFont(labelFont); 

  background(255);

  emptyCup = loadImage("CoffeeCup-02-empty.png");
  fullCup = loadImage("CoffeeCup-02-full.png");
  free = loadImage("free.png");

  scanButton = new Button(200, 500, 150, "Scan QR");
  exitButton = new Button(450, 500, 150, "Exit");
  qrDecoder = new Decoder();
  loyaltyCard = new LoyaltyCard();
}

void draw() {


  if (switchCamera) {

    drawCamera();

    if (!scanQR) {

      qrDecoder.warn();
    }
  } else {

    background(255);
    scanButton.hover();
    scanButton.draw();
    exitButton.hover();
    exitButton.draw();

    qrDecoder.draw();
    loyaltyCard.checkStamps();
    loyaltyCard.drawLoyaltyData();
  }
}



void mouseClicked() {

  float distanceFromScan = dist(mouseX, mouseY, scanButton.getButtonX(), scanButton.getButtonY());
  float distanceFromExit = dist(mouseX, mouseY, exitButton.getButtonX(), exitButton.getButtonY());

  if (distanceFromScan < scanButton.getButtonRadius()) {


    if (!switchCamera) {

      setupCamera();
      switchCamera = true;
    } else {
      // if user want to exit the scan when camera has opened,
      // clicking anywhere on the screen so that the camera can be closed even clikcing the button place which is covered by camera image 

      stopCamera();
      switchCamera = false;
    }
  } else {

    if (switchCamera) {

      stopCamera();
      switchCamera = false;
    }
  }


  if (distanceFromExit < exitButton.getButtonRadius()) {

    qrDecoder.exitQRDecoder();
    loyaltyCard.clearStamps();
  }
} 


void keyPressed() {
  if (key == ' ') {

    PImage scr = get(0, 0, width, height);

    if (qrDecoder.decodeQR(scr)) {

      scanQR = true;

      loyaltyCard.retrieveStampsData();
    } else {

      scanQR = false;
    }
  }
}
