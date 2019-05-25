# virtual-loyalty-card
<p>A QR code based loyalty card system. The system would replace card based systems such as the one shown below.</p>
<img src="https://github.com/qiuyangnie/virtual-loyalty-card/blob/master/img/cardBasedSystem.png">

# Workflow of the Virtual Loyalty Card
<p>To use the virtual loyalty card a customer</p>
<ul>
  <li>Signs up for a virtual loyalty card and receives a QR code image that they can store on their mobile phone (or print out) – (these QR code images have been generated)</li>
  <li>
    Uses the virtual loyalty card by presenting the QR code image to a camera at the till
    <ul>
      <li>The system checks the number of times the loyalty card has been presented by
accessing a database on a server</li>
      <li>If the user has sufficient virtual stamps on their card, their item is free and the
virtual loyalty card is reset to empty</li>
      <li>If not then their the number of virtual stamps is increased by one</li>
    </ul>
  </li>
  <li>Sees either
    <ul>
      <li>A screen showing that their item is free and sees their card reset to empty (to start all over again)</li>
      <li>Their card incremented by another stamp</li>
    </ul>
  </li>
</ul>
<p>This project concentrates on the interaction between the user and the system and does not consider the implementation of the server-based services. These server-based services are available via a RESTful interface.</p>

# Architecture of the Virtual Loyalty Card System
<img src="https://github.com/qiuyangnie/virtual-loyalty-card/blob/master/img/architecture.png" width="600">

# QR Code Image
<img src="https://github.com/qiuyangnie/virtual-loyalty-card/blob/master/img/QRCodeExample.PNG">

# Implementation Example
<img src="https://github.com/qiuyangnie/virtual-loyalty-card/blob/master/img/virtualLoyaltyCard.JPG" width="600">

# Acknowledgements
This project and information are based on the CS6100 assignment provided by John O’Mullane, UCC
