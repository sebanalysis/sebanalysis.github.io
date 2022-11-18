---
layout: posts
title: Python Strings
permalink: code/python-strings
categories: code
tags:
---

## Default String Type

In Python 3, all strings are Unicode strings are stored as a series of 'code points' (the integer reference numbers of the characters) unless preceded by `b'...`, designating an ASCII-encoded byte-string.
In Python 2, all strings were encoded by default as ASCII encoded byte strings, unless the string was preceded by a `u'...` designating a UTF-8 string.

Summary of the two strings types:
`'...'` | Unicode string | python3 native string = list of integers of Unicode code-points: `\u0000` → `\U0010ffff`
`b'...'` | Bytes   string | python2 native string = list of integers (including encoded ASCII characters): `\x00`  → `\xff`

A byte string only accepts literal ASCII characters or hexadecimal escape sequences in the style `\x##`. It only represents integer values between 0 and 255.
A Unicode string (default python 3 string) can represent all Unicode characters.
In Python 3, the u'string' notation doesn't throw an error to allow backward compatibility but changes nothing about the string

## Writing Unicode Characters

You must remember the following escape sequences used to enter Unicode characters into a string with the code point number in hexadecimal given by the #'s:

Escape Sequence to Write into Python | Character
-|-
 `"\x▯▯"` | ASCII Characters for code-points `00` to `ff` (all ASCII characters can be entered in this way)
`\u▯▯▯▯`|  Unicode Character for code-points from `0000` to `ffff` (hexadecimal numbers)
`\U▯▯▯▯▯▯▯▯`| Unicode Character for code-points `00000000` to `00110000` (hexadecimal numbers)
`\o▯▯▯`| Unicode character with octal value `▯▯▯`
`\N{name}`|Character `name` in the Unicode database

You must remember the following functions which convert between the Unicode character and it's decimal code-point value:

- `chr(▯)`  **returns Character** from Number
- `ord("c")` **returns  Decimal Number** from character

### Get Character: `chr(▯)`

Returns the Unicode character from the Code-Point decimal number.

```python
>>>chr(97)
'a'  
```

### Get Code-Point: `ord("▯")`

To get the decimal number value of the ASCII character, i.e. the reverse of `chr(▯)` use `ord('▯')`.

```python
>>>ord('a')
97  
```

All the following representations are equal:

```python
>>>"a" == "\x61" == "\u0061" ==  chr(0x61) == chr(ord("a"))
True
```

You can get a list of the 'codepoint' values  of Unicode characters in this example string "✅❌✍" with:

```python
>>>[ord(a) for a in "✅❌✍"]
[9989, 10060, 9997]
```

### Get List of Byte Values: `bytearray("…")`

`list(bytearray("…"))` returns the values of the bytes in a string as a list. Notice how this shows the value of the encoded bytes, not the code-point integers.

```python
>>>lst = list(bytearray("✅❌✍", encoding='utf-8'))
>>>print(lst)
[226, 156, 133, 226, 157, 140, 226, 156, 141]
```

To view these integers in binary, you have to apply some formatting. This has basically no practical function, but is it useful to visualize what is going on when you encode the text`"✅❌✍"`:

```python
>>>[str((bin(a))[2:].zfill(8)) for a in lst]
['11100010', '10011100', '10000101', '11100010', '10011101', '10001100', '11100010', '10011100', '10001101']
```

### Encode and Decode

You must know that u-string has a built in method for:  `.encode()` and b-string has a built in method for  `.decode()`. The default argument is "utf-8".
Encode means u-string → b-string
Decode means b-string → u-string

Encoding a u-string to a b-string via utf-8:

```python
>>>"✅❌✍".encode() 
b'\xe2\x9c\x85\xe2\x9d\x8c\xe2\x9c\x8d'
```

Decoding the above b-string to a u-string via utf-8:

```python
>>>b'\xe2\x9c\x85\xe2\x9d\x8c\xe2\x9c\x8d'.decode()
"✅❌✍"
```

The `bytes(string, "utf-8")` function is identical to the string `.encode()` method:

```python
>>>bytes("✅", "utf-8")
b'\xe2\x9c\x85'
```

### Specify Encoding When Writing a File

In Python 3 on Windows, the `open('newfile.txt','w') as f` makes a new file encoded with your system default which is _still_ apparently Windows-1252 (aka. cp1252).

Therefore you, need to specify the encoding as "UTF-8" every time: `open('newfile.txt','w', encoding='UTF-8') as f`.

### Reading python strings

When python reads a string. It will always replace `\r\n` with `\n`. So bear this in min when writing line breaks regular expressions.
