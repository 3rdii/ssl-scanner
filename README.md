# SSL Scanner Script

This bash script scans SSL certificates of a list of hosts using SSL Labs. The script saves the results in text files and checks if the grades of the SSL certificates are lower than A or A+.

## Requirements

This script requires:

- Docker (for the SSL Labs scan)
- Bash (for running the script)

## Usage

Follow these steps to run the script:

1. Clone the repository or copy the script to a local directory on your machine.
2. Update the paths in the script according to your system.
3. Run the script with the command `./ssl_scanner.sh` in a Bash shell.

The script saves the results in the `output.txt` and `risk.txt` files in the `/output` directory.

## Authors

This script was created by Can Yucel.

## Contributions

Contributions are welcome! Feel free to fork this project and submit a pull request with any improvements or modifications.

## License

This script is licensed under the [MIT License](LICENSE). See the LICENSE file for more information.

## Disclaimer

This script is intended for educational purposes only and should only be used on systems for which you have permission to scan. The use of this script for malicious purposes is strictly prohibited. The authors are not responsible for any damages or consequences caused by the use of this script.
