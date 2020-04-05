Matrix toMatrix(double[] arr){
  Matrix matrix = new Matrix(arr.length, 1);
  for ( int i = 0; i < arr.length; i++){
    matrix.data[i][0] = arr[i];
  
  }
  return matrix;

}





class NeuralNetwork{
  int input_nodes, hidden_nodes, output_nodes;
  Matrix weights_ih,weights_ho;
  Matrix bias_h, bias_o;
  float learning_rate;
  
  NeuralNetwork(int inp, int hid, int out){
    
    learning_rate = 0.1;
    input_nodes = inp;
    hidden_nodes = hid;
    output_nodes = out;
    weights_ih = new Matrix(hidden_nodes, input_nodes);      // 2,2
    weights_ho = new Matrix(output_nodes, hidden_nodes);     //1,2
    bias_h = new Matrix(hidden_nodes, 1);       //Changed         
    bias_o = new Matrix(output_nodes, 1);       //Changed
    weights_ih.randomize();
    weights_ho.randomize();
    bias_h.randomize();
    bias_o.randomize(); 
  }
    double[] feedForward(double[] arr){
    Matrix inputs = toMatrix(arr);

    Matrix hidden = weights_ih.multiply(inputs);

    
    
    hidden.plus(bias_h);
    hidden.sigmoid();
    
    Matrix output = weights_ho.multiply(hidden);
    output.plus(bias_o);
    output.sigmoid();
    //output.printMatrix();
    double[] r = output.toArray();
    
    return r;
    }
  
  void train(double[] input_array, double[] target_array){
    Matrix inputs = toMatrix(input_array);
    Matrix hidden = weights_ih.multiply(inputs);
    hidden.plus(bias_h);
    hidden.sigmoid();
    Matrix outputs = weights_ho.multiply(hidden);
    outputs.plus(bias_o);
    outputs.sigmoid();
    Matrix targets = toMatrix(target_array);
    Matrix output_errors = targets.subtract(outputs);
    outputs.disgmoid();
    Matrix gradients = outputs;
    gradients = gradients.multiply(output_errors);
    gradients.scaler(learning_rate);
    Matrix hidden_T = hidden.transpose();  // here
    Matrix weight_ho_deltas = gradients.multiply(hidden_T); // here
    weights_ho.plus(weight_ho_deltas);
    bias_o.plus(gradients);
    Matrix who_t = weights_ho.transpose();
    Matrix hidden_errors = who_t.multiply(output_errors);
    hidden.disgmoid();
    Matrix hidden_gradient = hidden;
    hidden_gradient = hidden_gradient.multiply(hidden_errors);
    hidden_gradient.scaler(learning_rate);
    Matrix input_T = inputs.transpose();
    Matrix weight_ih_deltas = hidden_gradient.multiply(input_T);
    weights_ih.plus(weight_ih_deltas);
    bias_h.plus(hidden_gradient);
    
  
  
  }







}
