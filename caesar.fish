function caesar
python -c "import string; plaintext = '$argv[1]'; shift = $argv[2]; alphabet = string.ascii_lowercase; shifted_alphabet = alphabet[shift:] + alphabet[:shift]; table = str.maketrans(alphabet, shifted_alphabet); print(plaintext.translate(table))"
end
