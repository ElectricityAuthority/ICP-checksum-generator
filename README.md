# ICP checksum generator

> A collection of code for generating ICP checksums.

There are four sets of code available for generating an ICP checksum:

- C - run using `checksum.c`.
- Python - consumed via the `gen_crc()` function in either `ICP_checksum.py` or `ICP_checksum.ipynb` (a Jupyter notebook).
- R - the `icp_checksum.R` program has the function `generate_ICP_checksum()` which takes an ICP number as an input. There is an example program, `generate_checksum_example.R`, which shows how to generate multiple checksums using a CSV as an input. Make sure to use the `ICP_checksum.Rproj` project file when running the code as all file paths are relative to the project folder location.
- VBA - consumed via an Excel spreadsheet (`GenerateICP.XLSM`).