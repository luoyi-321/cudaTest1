#include "testInclude.cuh"

__global__ void initial(double *area_data_rcs,double *area_data_x,double *x,double *area_data_y,int size1,int size2){
    int idx = blockIdx.x* blockDim.x + threadIdx.x;
    if (idx<size1){
        area_data_rcs[idx] = 1; //all{input3[2048*2048]} E 1;
        area_data_x[idx] = 2; //all{input3[2048*2048]} E 2;
        area_data_y[idx] = 4; //all{input3[2048*2048]} E 4;
    }
    __syncthreads();
    if(idx<size2){
        x[idx] = 3;   //all{input3[2048]} E 3;
    }
}

__global__ void testNoIf(double * area_data_x,double *area_data_y,double *area_data_rcs,double *x,double *nrn_n,double *result){

    // have 256 x and 2048*2048  
    register float r_x[2048];
    // register float r_y[45];
    int idx = blockIdx.x*blockDim.x+threadIdx.x;
    if(idx<Nrn*Nan){
        int nrn_min = 67;
        for(int i = 0;i<Nrn;++i){
            
            int nrn_n_ = nrn_n[i];
            // printf("nrn_n_: %d",nrn_n_);
            // int j = nrn_n_ - nrn_min;
            double target_x = area_data_x[i];  //2
            double target_y = area_data_y[i];  // 4
            double xtar = target_x - x[idx];  // 2 - 3
            double del_ta = xtar - target_y; //4-1
            double ytar = sqrt(del_ta*del_ta + 2*2); //15

            int r_n = floor(del_ta * del_ta) + nrn_n_;
            // double fmod_R_instant = fmod(del_ta, ytar);
            double beta_tar = ytar - xtar;

            // double beta_tar = atan((r_n/ target_x));
            // printf("%fd\n",beta_tar);

            // if(beta_tar<6.55){

                r_x[i] += beta_tar;
                // printf("d\n");
            // }
            // if(threadIdx.x<0)
            //     printf("%f",r_x[j]);

            // result[i] += beta_tar;

        }

        
    }
    __syncthreads();
    if(idx<Nrn*Nan){
        for(int i=0;i<Nrn;++i){
            // int j = i+67;
            result[i] = r_x[i];
        }
    }

}
