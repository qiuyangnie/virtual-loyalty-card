class Decoder {

  JSONObject json;
  String customer_info;
  String customer_created_time;
  String customer_name;
  String customer_id;

  BarCodeReader qrReader;

  boolean decodeQR(PImage img) {

    boolean infoFound;

    this.qrReader = new BarCodeReader(img);

    customer_info = qrReader.decode();

    if (customer_info == "Error: No Barcode") {

      infoFound = false;
      println("NO INFO");
    } else {

      infoFound = true;

      this.json = parseJSONObject(customer_info);

      this.customer_created_time = json.getString("created");

      this.customer_name = json.getString("name");

      this.customer_id = json.getString("ID");

      stopCamera();
      switchCamera = false;
    }

    return infoFound;
  }

  String getCustomer_id() {

    return this.customer_id;
  }

  String getCustomer_name() {

    return this.customer_name;
  }

  String getCustomer_created_time() {

    return this.customer_created_time;
  }

  void draw() {

    if (this.customer_created_time == null && this.customer_name == null) {

      textAlign(LEFT, CENTER);
      text("Welcome", 30, 90);
      //fill(color(255,0,0));
      textSize(20);
      text("Prepare your QR code and Click [Scan QR] button to collect your stamps, and get your 10th cup free when you have collected 9 stamps.", 30, 130, 245, 260);
      textSize(24);
    } else {

      textAlign(LEFT, CENTER);
      fill(color(50, 55, 100));
      text("Loyalty Joined Time:", 30, 90);
      if (this.customer_created_time != null) {
        fill(color(65,60,0));
        text(this.customer_created_time, 30, 120);
      }
      fill(color(50, 55, 100));
      text("Customer Name:", 30, 150);
      if (this.customer_name != null) {
        fill(color(65,60,0));
        text(this.customer_name, 30, 180);
      }
      fill(color(204, 102, 0));
    }
  }


  void warn() {
    fill(color(255, 234, 0));
    textSize(18);
    text("Oops! no QR info found, please try again:c", width/2, 100);
    textSize(24);
  }


  void exitQRDecoder() {

    this.customer_id = null;
    this.customer_created_time = null;
    this.customer_name = null;
  }
}
