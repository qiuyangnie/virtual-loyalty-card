class LoyaltyCard {

  float stampsWidth = 100, stampsHeight = 100;
  float gapX, gapY;

  int numOfStamps;
  int toGoStamps;

  boolean[] stamps;

  LoyaltyCard() {

    this.gapX = 10;
    this.gapY = 10;
  }

  int retrieveStampsData() {

    GetRequest get = new GetRequest("https://cs1.ucc.ie/~iw2/voucher/" + qrDecoder.getCustomer_id());
    get.send();

    this.numOfStamps = int(get.getContent());

    return this.numOfStamps;
  }


  int resetStampsData() {

    GetRequest get = new GetRequest("https://cs1.ucc.ie/~iw2/reset/" + qrDecoder.getCustomer_id());
    get.send();

    this.numOfStamps = int(get.getContent());

    return this.numOfStamps;
  }

  void checkStamps() {

    this.toGoStamps = 9 - this.numOfStamps;

    if (this.numOfStamps<9) {

      diplayStamps();

      println(this.numOfStamps + "down, " + this.toGoStamps + "to go");
    } else if (this.numOfStamps == 9) {

      diplayStamps();
      println("Get the 10th Free!");
      //resetStampsData();
    } else if (this.numOfStamps > 9) {

      resetStampsData();
      retrieveStampsData();
      diplayStamps();
    }
  }

  void diplayStamps() {

    stamps = new boolean[9];

    float x = gapX+300, y = gapY + 50;

    for (int i = 0; i < this.numOfStamps; i++) {
      stamps[i] = true;
    }

    for (int i = 0; i < stamps.length; i++) {

      if (i != 0 && i % 3 == 0) {

        x = gapX+300;
        y += stampsWidth + gapX;
      }

      if (stamps[i]) {

        image(fullCup, x, y, stampsWidth, stampsHeight);
      } else {

        image(emptyCup, x, y, stampsWidth, stampsHeight);
      }

      x += stampsWidth + gapX;
    }
  }  

  void drawLoyaltyData() {

    if (this.numOfStamps != 0 && this.numOfStamps != 9) {
      textAlign(LEFT, CENTER);
      text(this.numOfStamps + " down, " + this.toGoStamps + " to go", 30, 270);
    }

    if (this.numOfStamps == 9) {

      text("Well down! \nGet the 10th Free!", 30, 320);
      image(free,310, 125,347, 195);
    }
  }

  void clearStamps() {

    this.numOfStamps = 0;
  }
}
