import requests

def save_lines_to_file(url, file_name, max_lines):
    response = requests.get(url)

    if response.status_code == 200:
        print(f"Request for {url} was successful!")

        with open(file_name, 'w', encoding='utf-8') as file:
            lines_written = 0
            for line in response.iter_lines(decode_unicode=True):
                if lines_written >= max_lines:
                    break
                file.write(line + '\n')
                lines_written += 1

        print(f"Data from {url} saved to {file_name}")
    else:
        print(f"Request for {url} failed with status code: {response.status_code}")

# Define a list of URLs to scrape
urls = ['http://www.cs.iit.edu/~virgil/cs470/varia/traces/benchmarks/spice.din', 'http://www.cs.iit.edu/~virgil/cs470/varia/traces/benchmarks/tex.din']

# Specify the maximum number of lines to write for each URL
max_lines_per_url = 100

# Save data from each URL to a separate file
for i, url in enumerate(urls):
    if url = 'http://www.cs.iit.edu/~virgil/cs470/varia/traces/benchmarks/spice.din'
      file_name = f'spice.txt'
    else:
      file_name = f'cc1.txt'
    save_lines_to_file(url, file_name, max_lines_per_url)
