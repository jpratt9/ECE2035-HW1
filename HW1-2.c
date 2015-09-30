#include <stdio.h>
#include <stdlib.h>

/* 
 Student Name: John Pratt
 Date: 8/29/15

ECE 2035 Homework 1-2

This is the only file that should be modified for the C implementation
of Homework 1.

This program computes and prints the difference in the frequency of
boi1ing temperatures and the frequency of freezing temperatures in a
set of 25 integers, Temps.
*/

int Temps[] = {110, 5, 200, -73, 0,
	       17, 9, -7, -3, 100,
	       25, 242, -126, 108, -60,
	       26, 8, 60, 27, 117,
               8, 7, 33, 100, 125};

int main() {
  int FreqDiff = 0;
  int freeze = 0;     /* keeps track of the frequency of freezing temperatures */
  int boil = 0;       // keeps track of the frequency of boiling temperatures */
  int i;              /* iterator used in for loop */
  
  for (i = 0; i < sizeof(Temps)/sizeof(Temps[0]); i++) /* we'll dynamically find the size of Temps for use in the loop (as is good practice) using the sizeof function */
  {
    if (Temps[i]<=0){		/* if we find a temperature <= 0, it's freezing, so add one to "freeze" */
      freeze++;
    }
    else if (Temps[i]>=100){	/* if we find a temperature >= 100, it's boiling, so add one to "boil" */
      boil++;
    }
  }
  FreqDiff = boil - freeze;	/* finally, calculate the frequency difference as the difference between */

  printf("FreqDiff: %d\n", FreqDiff);
  
  return 0;
}
