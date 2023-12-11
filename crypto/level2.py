#!/bin/python3
import sys
from base64 import b64decode
from Crypto.Util.strxor import strxor

def decrypt_one_time_pad(key, ciphertext):
    key_bytes = b64decode(key)
    ciphertext_bytes = b64decode(ciphertext)

    decrypted_data = strxor(ciphertext_bytes, key_bytes)

    return decrypted_data.decode('utf-8')

def main():
    if len(sys.argv) != 3:
        print("Usage: python decrypt_one_time_pad.py <key_base64> <secret_ciphertext_base64>")
        sys.exit(1)

    key_base64 = sys.argv[1]
    secret_ciphertext_base64 = sys.argv[2]

    # Decrypt the secret
    decrypted_secret = decrypt_one_time_pad(key_base64, secret_ciphertext_base64)

    print("Decrypted Secret:", decrypted_secret)

if __name__ == "__main__":
    main()

# elegant python solution by kanak : bytes([a ^ b for a,b in zip(key, cipher_text)]) 
