#!/bin/python
import sys

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
        print('{ 0x' + hex_representation + ' };')
    else:
	    print('{ 0x' + ', 0x'.join(hex(ord(x))[2:] for x in ciphertext) + ' };')



try:
    plaintext = open(sys.argv[1], "rb").read()
except:
    print("Usage: python encrypt_with_xor.py PAYLOAD_FILE > OUTPUT_FILE")
    sys.exit()

if isinstance(plaintext, bytes):
    ciphertext = xor(plaintext, ENCRYPTION_KEY_BYTES)
else:
    ciphertext = xor(plaintext, ENCRYPTION_KEY)

printCiphertext(ciphertext)
