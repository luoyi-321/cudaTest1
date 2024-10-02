#include "testInclude.cuh"


std::vector<int> flatten_int(const std::vector<std::vector<double>>& input) {
    std::vector<int> flat;
    for (const auto& row : input) {
        flat.insert(flat.end(), row.begin(), row.end());
    }
    return flat;
}

vector<vector<double>> readTable(const string& filename, char delimiter = '\t',bool isTable = true) {
    ifstream file(filename);
    vector<vector<double>> table;

    if (!file.is_open()) {
        cerr << "Error opening file: " << filename << endl;
        return table;
    }
    printf("%s is reading......\n",filename.c_str());
    string line;
    // int n = 0;
    while (getline(file, line)) {
        // cout<<isTable;
        
        if(isTable){
            isTable = false;
            continue;
        }
        // cout<<(line)<<endl;
        // exit(1);
        vector<double> row;
        stringstream ss(line);
        string cell;
        // cout<<isTable<<endl;
        while (getline(ss, cell, delimiter)) {
            // cout<<stod(cell)<<endl;
            row.push_back(stod(cell));
        }
        // exit(1);
        table.push_back(row);
        // cout<<n<<endl;
        // n++;
    }
    file.close();
    printf("%s is load successful......\n",filename.c_str());
    return table;
}