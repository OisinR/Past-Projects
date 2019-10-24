int[] numbers = new int[5];
float[] floats = {1.2,3.5};

int[] num2 = {1,4,6,7,3};
int max = 0;
int min = 0;

int total = 0;

float f = Float.MAX_VALUE;

void setup()
{
 for (int i = 0; i < numbers.length; i++)
 {
   numbers[i] = i;
 }
 for (int n:numbers)
 {
   total +=n;
 }   
 min = num2[0];
 max = num2[0];
  for(int n:num2)
  {
     if( n > max)
     {
       max = n;
     }
     
     if (n < min)
     {
       min = n;
     }
     
  }
 
  int avr = numbers.length;
  avr = total/avr;
  //println(total);
  //println(avr);
  println(max);
  println(min);
  

}

void draw()
{
 
}