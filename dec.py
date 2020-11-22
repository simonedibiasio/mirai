#! /usr/bin/python3
import sys
import re


def find_macro(file_content):
    pairs_macros_values = re.findall(r"\(([0-9A-Z_]+),\s*\"(\\x.*)\".*\)",
                                     file_content)  # find all encrypted strings and their macro's name
    macro_strings = dict()  # using a dict {'MACRO': "value"}

    for s in pairs_macros_values:
        cipher = re.findall(r"0x[A-F0-9]{2}", re.sub(r"\\", "0", s[1]))  # substitute backslashes with 0
        message = []
        for i in cipher:
            i = int(i, 16) ^ 0x22
            message.append(i)
        macro_strings[s[0]] = ''.join(chr(char) for char in message)

    return macro_strings


def find_credentials(file_content):
    credentials_encrypted = re.findall(r"\(\"(\\x.*)\",\s*\"(\\x.*)*\".*\)",
                                       file_content)  # find all credentials
    credentials_decrypted = set()  # using a set to avoid repetition

    for s in credentials_encrypted:

        # decrypting username
        cipher_username = re.findall(r"0x[A-F0-9]{2}", re.sub(r"\\", "0", s[0]))  # substitute backslashes with 0
        username = []
        for i in cipher_username:
            i = int(i, 16) ^ 0x22
            username.append(i)

        # decrypting password
        cipher_password = re.findall(r"0x[A-F0-9]{2}", re.sub(r"\\", "0", s[1]))  # substitute backslashes with 0
        password = []
        for i in cipher_password:
            i = int(i, 16) ^ 0x22
            password.append(i)

        usr = ''.join(chr(char) for char in username)
        pwd = ''.join(chr(char) for char in password)

        credentials_decrypted.add(usr + ":" + pwd)

    return credentials_decrypted


if __name__ == '__main__':
    if len(sys.argv) <= 1:
        print("Usage: " + sys.argv[0] + " <fileName1> <fileName2> ... <fileNameN>")
        exit()

    fileList = sys.argv[1:]

    for fileName in fileList:

        f = open(fileName, "r")
        f_content = f.read()
        print("-----------------" + fileName + "-----------------")

        macros = find_macro(f_content)
        credentials = find_credentials(f_content)

        if len(macros):
            print("Macros: " + str(len(macros)))

        if len(credentials):
            print("Credentials: " + str(len(credentials)))

        for x, y in macros.items():
            print(x + ":\"" + y + "\"")

        for c in credentials:
            print(c)

        f.close()

