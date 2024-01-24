#!/bin/python
import sys
import argparse

ENCRYPTION_KEY = "secretxorkey"
ENCRYPTION_KEY_BYTES = b'secretxorkey'
#plaintext = "monkey"

def xor(plaintext, key):
    # Check if the input is a byte string
    if isinstance(plaintext, bytes):
        if not isinstance(key, bytes):
            raise ValueError("If plaintext is a byte string, the key must be a byte string as well")

        # XOR operation on each pair of bytes
        result = bytes([a ^ b for a, b in zip(plaintext, key)])
    else:
        # Convert text strings to byte strings using UTF-8 encoding
        plaintext_bytes = plaintext.encode('utf-8')
        key_bytes = key.encode('utf-8')

        # XOR operation on each pair of bytes
        result = bytes([a ^ b for a, b in zip(plaintext_bytes, key_bytes)])

    return result

def printCiphertext(ciphertext):
    if isinstance(ciphertext, bytes):
        hex_representation = ', 0x'.join(hex(x)[2:] for x in ciphertext)

        # Print the result
        return '{ 0x' + hex_representation + ' };\n'
    else:
	    return '{ 0x' + ', 0x'.join(hex(ord(x))[2:] for x in ciphertext) + ' };\n'


def save_key_to_file(key, filename):
    with open(filename, 'wb') as file:
        file.write(key)

def main():
    parser = argparse.ArgumentParser(description='===== XOR encryption script =====')
    parser.add_argument('input_file', help='Path to the input file for encryption')
    parser.add_argument('key', help='Key for XOR encryption')
    parser.add_argument('-o', help='Path to the output file for ciphertext (optional)')

    args = parser.parse_args()

    # Read the content of the input file
    with open(args.input_file, 'rb') as file:
        plaintext = file.read()

    # XOR operation
    key_bytes = args.key.encode('utf-8')
    ciphertext = xor(plaintext, key_bytes)

    # Save the key to a file
    key_file = "key.txt"
    save_key_to_file(key_bytes, key_file)
    print(f"Key saved to {key_file}")

    # Display the ciphertext or save to the output file
    if args.o is None:
        print("Cipher text:")
        print(printCiphertext(ciphertext))
    else:
        with open(args.o, 'wb') as file:
            file.write(printCiphertext(ciphertext).encode('utf-8'))
        print(f"Ciphertext saved to {args.o}")


if __name__ == "__main__":
    main()
