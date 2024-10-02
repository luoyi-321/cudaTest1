#include "testParamater.cuh"
#include "testInclude.cuh"
#include "testKernelFunc.cuh"
#include "func.cuh"

void initialize_data (){
    int fullSize = Nrn*Nan;
    printf("fullsize:%d",fullSize); 


    if(area_data_rcs != NULL && area_data_x != NULL && area_data_y != NULL){
        dim3 initBlocks(256);
        dim3 initgrids((fullSize+initBlocks.x-1)/initBlocks.x);

        // printf("da \n");

        initial<<<initgrids,initBlocks>>>(area_data_rcs,area_data_x,x,area_data_y,fullSize,Nrn);
        // printf("sizeof h_nrn_matrix: %d \n",h_nrn_matrix.size());
        // printf("da \n");


        // CUDA_CHECK(cudaMemcpy(nrn_n,h_nrn_matrix.data(),fullSize*sizeof(double),cudaMemcpyHostToDevice));
        
        dim3 testProcessBlocks(1);
        dim3 testProcessGrids(1+testProcessBlocks.x -1/testProcessBlocks.x);

        testNoIf<<<testProcessGrids,testProcessBlocks>>>(area_data_x,area_data_y,area_data_rcs,x,nrn_n,result);

        printf("ok \n");

    }else{
        printf("NULL \n");
    }
}


void allocateMem(){
    int fullSize = Nrn*Nan;
    if(area_data_rcs == NULL){
        CUDA_CHECK(cudaMalloc(&area_data_rcs,fullSize*sizeof(double)));
    }

    if(area_data_x == NULL){
        CUDA_CHECK(cudaMalloc(&area_data_x,fullSize*sizeof(double)));
    }

    if(area_data_y == NULL){
        CUDA_CHECK(cudaMalloc(&area_data_y,fullSize*sizeof(double)));
    }

    if(x == NULL){
        CUDA_CHECK(cudaMalloc(&x,Nrn*sizeof(double)));
    }

    if(nrn_n == NULL){
        CUDA_CHECK(cudaMalloc(&nrn_n,fullSize*sizeof(double)));
    }

    if(result == NULL){
        CUDA_CHECK(cudaMalloc(&result,fullSize*sizeof(double)));
    }

    nrn_matrix = readTable("/home/ubuntu/project/test20240927/readFile/nrn_matrix_lie.txt",',',false);

    h_nrn_matrix = flatten_int(nrn_matrix);

}


void testProcess(){
        
        printf("testProcess :NULL\n");
    
}