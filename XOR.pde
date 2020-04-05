  
float r, g, b;
NeuralNetwork nn = new NeuralNetwork(3,3,2);
String which = "black";

void setup(){
  size(800,400);
  noLoop();
  
  r = random(255);
  g = random(255);
  b = random(255);
  background(r,g,b);
  
  
  for ( int i = 0; i < 100000; i++){
    float r1 = random(255);
    float b1 = random(255);
    float g1 = random(255);
    
    double[] inputs = new double[] {r1/255, g1/255, b1/255}; 
    double[] targets = trainColor(r1,g1,b1);
    nn.train(inputs, targets);
  
  }
  

}
void draw(){
  background(r,g,b);
  strokeWeight(4);
  stroke(0);
  line(width / 2, 0, width / 2, height);
  textSize(64);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Black", 150, 150);
  fill(255);
  text("White", 650, 150);
  noStroke();
  
  which = predict();
  if (which == "black"){
    fill(0);
    ellipse(150,250,60,60);
  } else {
    fill(255);
    ellipse(650,250,60,60);
    }

    
}

String predict(){
  double[] input_data = new double[] {r/255, g/255, b/255};
  double[] outputs = nn.feedForward(input_data);
  println(outputs);
  if (outputs[0] > outputs[1]){
    return "black";
  } else{
  return "white";
  }



}
  
  
void mousePressed(){
  
  r = random(255);
  g = random(255);
  b = random(255);
  println(r+g+b);
  redraw();
 }
  
 
  
double[] trainColor(double r1,double g1,double b1){
  double[] black = new double[] {1 , 0};
  double[] white = new double[] {0 , 1};

  if ( r1 + g1 + b1  > 300){
    return black;
  } else{
    return white;
  }

}




  
  
