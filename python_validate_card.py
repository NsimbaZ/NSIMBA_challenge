# Enter your code here. Read input from STDIN. Print output to STDOUT

# import regex package
import re

# get range of input for repeated match check
for _ in range(int(input())):
    s = input()
    
    # check for pattern and consecutive repeats
    if re.match(r"^[456]([\d]{15}|[\d]{3}(-[\d]{4}){3})$", s) and not re.search(r"([\d])\1{3}", s.replace("-", "")):
        print("Valid")
    else:
        print("Invalid")
