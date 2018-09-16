#include <stdio.h>

void moving_avg(float *sig, float *sigf, int N, int D){
	
			int i, j;
			int	a = D/2;
			float tempsum;
	
	for(i = 0; i<N; i++){
		tempsum = 0;
		for(j = i-a;j <=(i-a+D-1); j++){
			if(j < 0 || j > N){
				tempsum = tempsum + 0;
			}
			else {
				float tempsig = sig[j];
				tempsum = tempsum + tempsig;
			}
		}
		sigf[i] = tempsum /D;
		//printf("%f\n", tempsum);
	}
}