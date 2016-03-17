class Koch{

  // defaults
  int levels = 3;
  int edgeWidth = 400;

  // colors
  color pink = color(255, 20, 147);
  color green = color(154, 205, 50);
  color red = color(300, 28, 87);
  color yellow = color(255, 215, 0);

  Koch(levels, width){
    this.levels = levels;
    this.edgeWidth = width;
  }

  void draw(){
    int levels = this.levels;
    int edgeWidth = this.edgeWidth
    
    background(0, 0);
    int c2 = Math.pow(edgeWidth, 2) + Math.pow(edgeWidth/2, 2);
    int offsetW = (width-edgeWidth)/2;
    int offsetH = height-Math.sqrt(c2);

    // start at x, y = 100, 200
    translate(offsetW, 200);

    // set styles
    strokeWeight(4);
    strokeJoin(ROUND);
    stroke(pink);

    // draw three edges in a triangle
    this.edge(edgeWidth, levels) 
    rotate(radians(120))
    this.edge(edgeWidth, levels) 
    rotate(radians(120))
    this.edge(edgeWidth, levels) 

    // save to png
    // save('koch-'+levels+'.png')
  }

  void edge(length, level){
    // segment length
    int sl = length/3;

    // base case, draw single _/\_
    if(level == 1){
        // _
        line(0, 0, sl, 0);

        // _/
        translate(sl, 0);
        rotate(radians(-60));
        line(0, 0, sl, 0);

        // _/\
        translate(sl, 0);
        rotate(radians(120));
        line(0, 0, sl, 0);
        
        // _/\_
        translate(sl, 0);
        rotate(radians(-60));
        line(0, 0, sl, 0);

        // end at the end of last segment
        translate(sl, 0);
    }

    // recursive case, draw edge for every segment
    else {
        // _
        stroke(pink);
        edge(sl, level-1);

        // _/
        stroke(green);
        rotate(radians(-60));
        edge(sl, level-1);

        // _/\
        stroke(red);
        rotate(radians(120));
        edge(sl, level-1);

        // _/\_
        stroke(yellow);
        rotate(radians(-60));
        edge(sl, level-1);
    }
}
}