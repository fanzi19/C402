# Python script to preprocess trace data with status for Gnuplot

data = {}  # Dictionary to store address frequencies

with open('cc1.txt', 'r') as file:
    for line in file:
        parts = line.strip().split()  # Split the line into columns
        if len(parts) == 2:  # Ensure there are exactly two columns
            status, address = parts
            address = int(address, 16)  # Convert hexadecimal to decimal
            # Create a dictionary key based on status and address
            key = (status)
            if key in data:
                data[key] += 1
            else:
                data[key] = 1

# Save the processed data in a file that Gnuplot can read
with open('processed_data.txt', 'w') as output_file:
    for status, frequency in data.items():
        output_file.write(f"{frequency} {status}\n")
