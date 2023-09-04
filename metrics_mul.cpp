#include <iostream>
#include <vector>
#include <random>
#include <chrono>

int main() {
    const int numTests = 10;  // Number of times to run the matrix multiplication
    double totalDuration = 0.0;  // Total duration of all tests

    for (int test = 0; test < numTests; ++test) {
        // Create random number generators for dimensions and values
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<int> dim_distribution(200, 500);  // Adjust the range for dimensions as needed
        std::uniform_int_distribution<int> value_distribution(1, 10); // Adjust the range for values as needed

        // Generate random dimensions for the two matrices
        int numRows1 = dim_distribution(gen);
        int numCols1 = dim_distribution(gen);
        int numRows2 = numCols1; // The number of columns in matrix 1 must match the number of rows in matrix 2
        int numCols2 = dim_distribution(gen);

        // Check if the matrices can be multiplied
        if (numCols1 != numRows2) {
            std::cerr << "Matrix dimensions are incompatible for multiplication." << std::endl;
            return 1; // Exit the program with an error code
        }

        // Create and fill the first random matrix
        std::vector<std::vector<int> > matrix1(numRows1, std::vector<int>(numCols1));
        for (int i = 0; i < numRows1; ++i) {
            for (int j = 0; j < numCols1; ++j) {
                matrix1[i][j] = value_distribution(gen);
            }
        }

        // Create and fill the second random matrix
        std::vector<std::vector<int> > matrix2(numRows2, std::vector<int>(numCols2));
        for (int i = 0; i < numRows2; ++i) {
            for (int j = 0; j < numCols2; ++j) {
                matrix2[i][j] = value_distribution(gen);
            }
        }

        // Measure the execution time
        auto start_time = std::chrono::high_resolution_clock::now();

        // Perform matrix multiplication and store the result in 'result'
        std::vector<std::vector<int> > result(numRows1, std::vector<int>(numCols2, 0));

        for (int i = 0; i < numRows1; ++i) {
            for (int j = 0; j < numCols2; ++j) {
                for (int k = 0; k < numCols1; ++k) {
                    result[i][j] += matrix1[i][k] * matrix2[k][j];
                }
            }
        }

        // Measure the execution time again
        auto end_time = std::chrono::high_resolution_clock::now();
        auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end_time - start_time);

        totalDuration += duration.count();

        // Print the generated matrices and the result for each test
        std::cout << "Test " << (test + 1) << ":" << std::endl;
        std::cout << "Matrix 1:" << std::endl;
        for (int i = 0; i < numRows1; ++i) {
            for (int j = 0; j < numCols1; ++j) {
                std::cout << matrix1[i][j] << " ";
            }
            std::cout << std::endl;
        }

        std::cout << "Matrix 2:" << std::endl;
        for (int i = 0; i < numRows2; ++i) {
            for (int j = 0; j < numCols2; ++j) {
                std::cout << matrix2[i][j] << " ";
            }
            std::cout << std::endl;
        }

        std::cout << "Matrix 1 * Matrix 2:" << std::endl;
        for (int i = 0; i < numRows1; ++i) {
            for (int j = 0; j < numCols2; ++j) {
                std::cout << result[i][j] << " ";
            }
            std::cout << std::endl;
        }

        std::cout << "Execution time for Test " << (test + 1) << ": " << duration.count() << " microseconds." << std::endl << std::endl;
    }

    double averageDuration = totalDuration / numTests;
    std::cout << "Average execution time over " << numTests << " tests: " << averageDuration << " microseconds." << std::endl;

    return 0;
}
