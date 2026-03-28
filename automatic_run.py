import pydirectinput
import time
pydirectinput.PAUSE = 0.01
time.sleep(2)

uppercase_map = {
    "a": "A",
    "b": "B",
    "c": "C",
    "d": "D",
    "e": "E",
    "f": "F",
    "g": "G",
    "h": "H",
    "i": "I",
    "j": "J",
    "k": "K",
    "l": "L",
    "m": "M",
    "n": "N",
    "o": "O",
    "p": "P",
    "q": "Q",
    "r": "R",
    "s": "S",
    "t": "T",
    "u": "U",
    "v": "V",
    "w": "W",
    "x": "X",
    "y": "Y",
    "z": "Z",
    "1": "!",
    "2": "@",
    "3": "#",
    "4": "$",
    "5": "%",
    "6": "^",
    "7": "&",
    "8": "*",
    "9": "(",
    "0": ")",
    "-": "_",
    "=": "+",
    "`": "~",
    "[": "{",
    "]": "}",
    ";": ":",
    "'": '"',
    ",": "<",
    ".": ">",
    "/": "?",
    "\\": "|"
}

special_chars = []
for char in uppercase_map.keys():
    special_chars.append(uppercase_map[char])
print(special_chars)

reverse_uppercase_map = {v: k for k, v in uppercase_map.items()}

def stringmanager(string):
    for char in string:
        if char in reverse_uppercase_map or char.isupper():
            pydirectinput.keyDown('shift')
            pydirectinput.press(reverse_uppercase_map[char])
            pydirectinput.keyUp('shift')
        else:
            pydirectinput.press(char)

stringmanager('sudo curl -L https://raw.githubusercontent.com/aiden-powers/setup-nix-os/refs/heads/main/setup.sh | bash')
#stringmanager('sudo nano /etc/nixos/configuration.nix')
pydirectinput.keyDown('enter')
pydirectinput.keyUp('enter')