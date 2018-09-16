#include <stdio.h>
#include <movavg.h>


int main() {
	
	//input parameters
	float list [5] = {1, 2, 3, 4, 5};
	float listf [5];
	int D = 3;
	int N = 5;
	
	//call the algorithm
	
	moving_avg(&list[0], &listf[0], N, D);

	
	for(int i=0; i<N; i++){
		printf("%f\n",listf[i]);
	}
	
	return 0;
}


