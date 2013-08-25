#include<stdio.h>
#include<stdlib.h>
#include<assert.h>

void
cliffsd(double *control, int *controlcnt, double *pilot, int *pilotcnt, 
    double *delta) {
  int control_bigger = 0, pilot_bigger = 0;
  int i, j;
  *delta = 0;

  for (i = 0; i < *pilotcnt; i++) {
    control_bigger = pilot_bigger = 0;
    for (j = 0; j < *controlcnt; j++) {
      if (pilot[i] > control[j]) {
        pilot_bigger++;
      } else if (control[j] > pilot[i]) {
        control_bigger++;
      }
    }
    *delta += ((double)(pilot_bigger - control_bigger) / *pilotcnt);
  }

  *delta = (double)(*delta / *controlcnt);
}

//int
//main(int argc, char **argv) {
//  double control[10] = {1.0,1.0,2.0,2.0,2.0,3.0,3.0,3.0,4.0,5.0};
//  double pilot[6] = {1.0,2.0,3.0,4.0,4.0,5.0};
//  double result[1] = {0};
//  int controlcnt[1] = {10}; 
//  int pilotcnt[1] = {6}; 
//
//  cliffsd(control, controlcnt, pilot, pilotcnt, result); 
//  printf("cliffs.d = %f\n", result[0]); 
//  assert(result[0] == 0.25);
//  exit(0);
//}
