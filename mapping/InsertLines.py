import fileinput
import sys
import os
def  modify_file(file_name,pattern,value=""):  
    with fileinput.FileInput(file_name, inplace=True, backup='.bak') as file:
        for line in file:
            print(line.replace(pattern, value), end='')  

mappingpath = os.path.dirname(os.path.abspath(__file__))

with open("vivadoBuild.tcl") as f:
    lines = f.readlines()
lines[0] = "set projPath \"" + mappingpath[:-7] + "\"\n"

with open("vivadoBuild.tcl", "w") as f:
    f.writelines(lines)