
int x[] = {9, 8, 7, 6, 5, 4, 3, 2, 1, 0};
int index0 = 0, index1 = 1, min_idx = 0;
void setup() {
  size(1280, 720);
  textSize(48);
  //selectionSort(x);
}
void draw() {
  background(0);
  textSize(48);
  for (int index=0; index<x.length; index++) {
    fill((index<index0)?200:255);
    rect(240+100*index, 610-60*x[index], 60, 30+60*x[index], 10);
    text(x[index], 255+100*index, 600-60*x[index]);
  }
  stepSort(x);
  drawHelp();
  delay(500);
}
void selectionSort(int arr[]) 
{ 
  int n = arr.length; 

  // One by one move boundary of unsorted subarray 
  for (int i = 0; i < n-1; i++) 
  { 
    // Find the minimum element in unsorted array 
    min_idx = i; 
    for (int j = i+1; j < n; j++) 
      if (arr[j] < arr[min_idx]) 
        min_idx = j; 

    // Swap the found minimum element with the first 
    // element 
    int temp = arr[min_idx]; 
    arr[min_idx] = arr[i]; 
    arr[i] = temp;
  }
}
void stepSort(int [] arr) {
  if (index0<arr.length) {
    rect(240+100*(index1-1), 670, 60, 30, 10);
    fill(100);
    rect(240+100*min_idx, 610-60*x[min_idx], 60, 30+60*x[min_idx], 10);
    if (index1 >= arr.length) {
      int temp = arr[min_idx]; 
      arr[min_idx] = arr[index0]; 
      arr[index0] = temp;
      index0++;
      index1 = index0+1;
      min_idx = index0;
    }

    if (index1 < arr.length) {
      if (arr[index1] < arr[min_idx]) min_idx = index1;
      index1++;
    }
  
  }
  
  println(index0 +" " +index1+" "+min_idx);
}
void drawHelp(){
  textSize(20);
  fill(255);
  text("Unsorted elements", 50,218);
  text("Sorted elements", 50,318);
  text("Minimum unsorted", 50,418);
  text("element", 100,440);
  rect(20,200,20,20,3);
  fill(200);
  rect(20,300,20,20,3);
  fill(100);
  rect(20,400,20,20,3);
}

void keyPressed() {
  index0 = 0;
  index1 = 1;
  min_idx = 0;
  for (int i=0; i<10; i++) x[i] =9-i;
}
