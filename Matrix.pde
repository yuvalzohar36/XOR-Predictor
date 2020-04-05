import java.util.Arrays; 

class Matrix{
  int rows, cols;
  double[][] data;
  Matrix(int rows_num, int cols_num){
    rows = rows_num;
    cols = cols_num;
    data = new double[rows][cols];
    for (int i = 0; i < rows; i++){
      for (int j = 0; j < cols; j++){    // Intialize to 0
        data[i][j] = 0;
      }
    }
  }
  
  void randomize(){
    for (int i = 0; i < rows; i++){
      for (int j = 0; j < cols; j++){
        data[i][j] = random(-1,1);
      }
    }
  }
  
  void printMatrix(){
    System.out.println(Arrays.deepToString(data).replace("], ", "]\n").replace("[[", "[").replace("]]", "]"));
  
  }
  
  void plus(Matrix n){
   for (int i = 0; i < rows; i++){                                //Using overloading in java
      for (int j = 0; j < cols; j++){
        data[i][j] += n.data[i][j];
      }
   }
  }
  void plus(double n){
    for (int i = 0; i < rows; i ++){
      for ( int j = 0; j < cols; j++){
        data[i][j] += n;
      }
    }
  }
  
  void scaler(double n){
    for (int i = 0; i < rows; i++){                                //Using overloading in java
      for (int j = 0; j < cols; j++){
        data[i][j] *= n;
      }
    }
  }
   
   Matrix multiply(Matrix n){
    Matrix result = new Matrix(rows,n.cols);
    for (int i = 0; i < result.rows;i++){
      for ( int j = 0 ; j < result.cols;j++){
        //dot product
        double sum =0;
        for (int k = 0; k < cols; k++){
          sum+= data[i][k] * n.data[k][j];
        }
        result.data[i][j] = sum;
      }
    }
    return result;
   }
 
 
 Matrix transpose(){
   Matrix result = new Matrix(cols, rows);
   for (int i = 0; i < rows; i++){                                //Using overloading in java
      for (int j = 0; j < cols; j++){
        result.data[j][i] += data[i][j];     
      }
    }
    return result;
 }
 
   void sigmoid(){
    for (int i = 0; i < rows; i++){
      for (int j = 0; j < cols; j++){
        double val = data[i][j];
        data[i][j] = 1 / ( 1 + Math.exp(-val));
      }
    }    
  }
  
    void disgmoid(){ 
      for (int i = 0; i < rows; i++){
        for (int j = 0; j < cols; j++){
          double val = data[i][j];
          data[i][j] = val * (1 - val);
        }
      }
   }
      
      
      
  double[] toArray(){
    double[] arr = new double[rows*cols];
    for (int i = 0; i < rows; i++){
        for (int j = 0; j < cols; j++){
          arr[i] = data[i][j] ;                      //Should be arr[i], not j !
        }
      }
     return arr;
  }
  
  Matrix subtract(Matrix m){
    Matrix result = new Matrix (rows, m.cols);
    for (int i = 0; i < rows; i++){                                //Using overloading in java
      for (int j = 0; j < cols; j++){
        result.data[i][j] = data[i][j] - m.data[i][j];
      }
    }
    return result;
  }
}
