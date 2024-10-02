
#include "testInclude.cuh"

const int Nrn=2048;
const int Nan=2048;

vector<vector<double>> nrn_matrix;
vector<int> h_nrn_matrix;

double * area_data_x = NULL;
double * area_data_y = NULL;
double * area_data_rcs = NULL;


double * x = NULL;
double * nrn_n=NULL;
double * result;