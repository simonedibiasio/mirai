#! /usr/bin/python3

import re


cipher = input("Enter the ciphertext: ")
cipher = re.findall(r"0x[A-F0-9]{2}", re.sub(r"\\", "0", cipher)) # substitute backslashes with 0

message = []
for i in cipher:
	i = int(i, 16) ^ 0x22
	message.append(i)

print(message)
print(''.join(chr(char) for char in message))
