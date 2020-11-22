#! /usr/bin/python3
import sys
import re

if __name__ == '__main__':
    if len(sys.argv) <= 1:
        print("Usage: " + sys.argv[0] + " <fileName1> <fileName2> ... <fileNameN>")
        exit()

    fileList = sys.argv[1:]

    for fileName in fileList:
        f = open(fileName, "r")
        content = f.read()
        strings = re.findall(r"\"[\\x0-9A-F]+\"", content)  # find all enrypted strings

        if len(strings):
            print(fileName + ": " + str(len(strings)))
        f.close()

