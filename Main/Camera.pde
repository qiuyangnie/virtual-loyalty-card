import processing.video.*;

Capture QRCamera;

void setupCamera() {


  String[] cameras = Capture.list();

  if (cameras.length != 0) {
    QRCamera = new Capture(this, cameras[0]);
    QRCamera.start();
    println("Camera Info: "+cameras[0]);
  }
}

void stopCamera(){

  QRCamera.stop();

}

void drawCamera() {

  if (QRCamera.available() == true) {
    QRCamera.read();
  }

  image(QRCamera, 0, 0);
  
  textAlign(CENTER);
  fill(color(255, 204, 0));
  text("Please show your QR code and hit SPACE key to scan", width/2, 30);
  text("OR click anywhere to exit scanning", width/2, 60);
  //fill(color(255, 204, 0));
  
}
