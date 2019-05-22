import processing.svg.*;
import processing.pdf.*; 
boolean record;

import controlP5.*;
ControlP5 controlP5;
ControlP5 cp5;


boolean lines = true;
boolean save = false;
boolean theFlag = true;
public boolean redflag=true;
public boolean blackflag=true;
int file_count= 0;
public int size =10;
public int  Stroke_Weight_temp = 2;



CA ca;   // An instance object to describe the Wolfram basic Cellular Automata

public void setup() {
  size(displayWidth, displayHeight);
  int[] ruleset = {0,1,0,1,1,0,1,0};    // An initial rule system
  ca = new CA(ruleset);                 // Initialize CA
  noFill();
  background(255);
  beginRecord(PDF, "image/"+"cells_"+file_count+".pdf");
  
 ///////////////////
 controlP5 = new ControlP5(this);
 // change the default font to Verdana
 PFont p = createFont("Verdana",10); 
 ControlFont font = new ControlFont(p);
 // change the original colors
 controlP5.setColorForeground(0xffaa0000);
 controlP5.setColorBackground(0xff660000);
 controlP5.setFont(font);
 controlP5.setColorActive(0xffff0000);

//// this is the menu stuff
cp5 = new ControlP5(this);
 cp5.begin();
 
 cp5.addBackground("abc")
  .setSize(300,200)
  //.setPosition(40, 80)
  .setBackgroundColor(color(122,122,122,10));
  
  cp5.addSlider("CELL_SIZE")
     .setBroadcast(false)
     .setPosition(10, 20)
     .setSize(200, 20)
     .setRange(1, 30)
     .setValue(10)
   
     .setBroadcast(true);
     ;

     cp5.addButton("SAVE_CELLS")
     .setBroadcast(false)
     .setValue(0)
     .setPosition(10,60)
     .setSize(200,20)
     .setBroadcast(true);
     ;
  
  
  cp5.addButton("EXIT")
     .setBroadcast(false)
     .setValue(0)
     .setPosition(10,90)
     .setSize(200,20)
     .setBroadcast(true);
     ;
 
 // create a toggle and change the default look to a (on/off) switch look
  cp5.addToggle("Red")
     .setPosition(10,120)
     .setSize(50,20)
     .setValue(true)
     .setMode(ControlP5.SWITCH)
     ;
    
    cp5.addToggle("BLACK")
     .setPosition(70,120)
     .setSize(50,20)
     .setValue(true)
     .setMode(ControlP5.SWITCH)
     ;
     
   cp5.addSlider("Stroke_Weight")
     .setBroadcast(false)
     .setPosition(10, 160)
     .setSize(200, 20)
     .setRange(1, 5)
     .setValue(2)
     .setBroadcast(true);
     ;
     
  cp5.end();
 /////////////////
}

public void draw() {
  ca.render();    // Draw the CA
  ca.generate();  // Generate the next level
  if (ca.finished()) {   // If we're done, clear the screen, pick a new ruleset and restart
    beginRecord(PDF, "image/"+"cells_"+file_count+".pdf");
    noFill();
    background(255);
    ca.randomize();
    ca.restart();
     
  }
}

public void EXIT(){
exit();
}

public void SAVE_CELLS(){
file_count++;
save = true;
}

void CELL_SIZE(int cell_scale) {
  size  = cell_scale;

}

void Stroke_Weight(int Stroke_Weight_int) {
 Stroke_Weight_temp = Stroke_Weight_int;
}

void Red(boolean theFlag) {
  if(theFlag==true) {
   redflag=true;
  } else {
   redflag=false;
  }
}

void BLACK(boolean theFlag2) {
  if(theFlag2==true) {
   blackflag=true;
  } else {
   blackflag=false;
  }
}