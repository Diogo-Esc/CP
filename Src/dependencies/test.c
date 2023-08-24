#include<stdio.h>
#include<omp.h>
#include<stdlib.h>
#include<math.h>

int main(int argc, char *argv[]) {
	
	omp_set_num_threads(2);

	int k = 0;
	float arr[1000];
	
	for(int i=0;i<1000;i++){
		arr[i]=1.0;
	}

	//#pragma omp parallel for
	for(int i = 0; i<25; i++){
		
		int a = i + 2;

		#pragma omp parallel for
		for (k=0; k<1000; k++){

			float e = sqrtf( (float)k + a);
			
			//dependencia aqui arr[k]
			arr[k] = arr[k] + e;
		}

	}

	for(int i=0;i<1000;i++){
		printf("%f\n",arr[i]); 
	}


}


