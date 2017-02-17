To convert character to symbol, use `` `$ `` as in:

    q)`$"ibm"
    `ibm

Otherwise, use any of char, num or name to convert types (where possible):

    q)"f"$2 3 5
    2 3 5f
    q)9h$2 3 5
    2 3 5f
    q)`float$2 3 5
    2 3 5f

To convert a string to an atom type, use uppercase char:

    q)"F"$"23"
    23f


