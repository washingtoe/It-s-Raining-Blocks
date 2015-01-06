ArrayList<Drops> squares = new ArrayList<Drops>();
void setup() {
  noStroke();
  size(displayWidth, displayHeight);
  frameRate(30);
  colorMode(HSB, 360, 100, 100, 100);
  fill(random(360), 100, 100, 50);
}

void draw() {
  //makes new squares appear at a designated location
  squares.add(new Drops());
  background(0);
  //goes through every possible square
  for (int i = squares.size ()-1;i>=0;i--) {
    //assigns "p", makes p do predetermined things in class
    Drops p = squares.get(i);
    p.display();
    p.move();
    //erases extra p's
    if (p.off()) {
      squares.remove(i);
    }
  }
}
class Drops {
  PVector loc, vel, acc;
  float sz;
  Drops() {
    loc=new PVector(0,0);
    //jump arc is dependent on mouse location
    vel=new PVector(random(map(mouseX-loc.x,0,width,0,100)-10,map(mouseX-loc.x,0,width,0,100)+10), random(-50, -150));
    acc=new PVector(0, 10);
    sz=20;
    //shuffles origin around, isn't working as hoped
    if(keyPressed){
      if(key=='w'){
        loc.y-=50;
      }
      if(key=='s'){
        loc.y+=50;
      }
      if(key=='a'){
        loc.x-=50;
      }
      if(key=='d'){
        loc.x+=50;
      }
    }
  }

  void display() {
    //a wild rectangle appears!
    rect(loc.x, loc.y, sz, sz);
  }

  void move() {
    //every drop follows physics now
    vel.add(acc);
    loc.add(vel);
  }

  boolean off() {
    //check if a drop needs erasing
    if (loc.y>height) {
      return true;
    } 
    else {
      return false;
    }
  }
}

