#include <iostream>

// Function to calculate the Ackermann's function
int ackermann(int x, int y) {
    if (x == 0) {
        return y + 1;
    } else if (y == 0) {
        return ackermann(x - 1, 1);
    } else {
        return ackermann(x - 1, ackermann(x, y - 1));
    }
}

int main() {
    int x, y;

    // Ask the user for input
    std::cout << "Enter a non-negative integer x: ";
    std::cin >> x;
    std::cout << "Enter a non-negative integer y: ";
    std::cin >> y;

    // Check for non-negative inputs
    if (x < 0 || y < 0) {
        std::cout << "Both x and y must be non-negative integers." << std::endl;
    } else {
        // Calculate and display the result
        int result = ackermann(x, y);
        std::cout << "A(" << x << ", " << y << ") = " << result << std::endl;
    }

    return 0;
}
