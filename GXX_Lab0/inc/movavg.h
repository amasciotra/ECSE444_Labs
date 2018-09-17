#ifndef MOVAVG_H
#define MOVAVG_H

	void moving_avg(float *sig, float *sigf, int N, int D);
	extern void mov_asm(float *sig, float *sigf, int N, float D);
	
#endif
