---
layout: post
title: Plain Text
permalink : code/plain-text
categories: Code
tags:
---

## Think of each file as either Plain Text or "Binary"

Understand that a computer is just a bunch of files with processes being done to them, many of which are unseen to the user. Each file is _either_ text or 'binary'. Every use of the open command; `'open('file.whatever', 'r') as f:`, in python is reading the file 'from disk' and temporarily storing the series of bits in the file in RAM with the handle `'f'` now added to the name-space of the python script.

- A text file a.k.a."human readable file" in the context of software development, is a source code to a program. Opening the file in Notepad++ is your key to understanding these files. A text file is simply a string of characters of which linefeed, tab and space are all characters too.
- A  "binary" file a.k.a. "non-human readable file"  includes photo .jpg .png .ps, music .mp3, and video .mp4 files. It includes programs called executable files which are also known as 'the binary' or 'compiled code' (.exe on windows or .x file on mac).  The decision to use binary encoding rather than text encoding is usually made to conserve storage space. Encoding data in a non-readable binary format typically requires fewer bytes of storage and increases efficiency of access (input and output) by eliminating format parsing or conversion. The encoding is specific to the program it is designed for.

Text files are encoded into binary too which is why I have used the "" marks. The point is really that text-file can be decoded into characters but binary files read as a seemingly meaningless series of random glyphs.

***

## Plain Text Files

A plain text file, or 'human readable file' is just a __string__ of characters saved to hard drive (i.e. 'to disk') using a certain encoding with a file name and extension.

> Key Point: In text files, non-letters and invisible characters are each still encoded as a unique character. For example: space, tab and, line-break are each encoded into 1-byte as a character like any letter.

- __Encoding__: The text encoding is the protocol for encoding characters in to bits (0s and 1s) to be saved onto disk. The string `"a dog"` encoded with UTF-8 is: '`01100001 00100000 01100100 01101111 01100111`'. You can normally see the current encoding type in the bottom-right corner of the editor. It is almost always __UTF-8__.
- __File Name Extensions__: They don't have any affect on the contents of the file. They are just a pointer to tell the operating system what software to open it with. The default text file in windows is `.txt`, but often scientific software uses `.inp`, python files by convention use `.py`, c files are `.c`, javascript `.js`.  Text editors for coding (e.g. Notepad++, PyCharm, VSCode, Eclipse) do syntax highlighting according to language, which is implied from the file extension, not the content of the file.
- __Language__: This is the programming language the file is written in. Should match the file extension. Language could be Python (.py), Java (.java), etc. Text based data storage Formats include most notably. JSON (.json), yaml (.YAML) and xml (.xml).
- __Line-break style__: There are two common ways to represent a line-break in a text file. Windows uses two characters (Carriage Return __CR___, Line-Feed __LF__) and Mac and Linux use one character (Line-Feed __LF__ ). In every plain-text viewer, in addition to the encoding type, you will see either CR-LF or LF in the bottom right corner.

Text files are just strings, i.e. a series of characters. In memory the files are represented as a series of 1s and 0s (each 0 or 1 is called a bit). UTF-8 encoding  is the way (almost 100% of all electronic text worldwide in 2022) that computers use to map the series of bits into characters. Unicode is descended from ASCII. You have to understand ASCII to understand Unicode.

> Key Point: Most people think of a word document as a text file. But note that a word document is actually `.zip` folder containing  `.xml` plain-text files. If you change the extension from `.docx` to `.zip` you can extract and read them.  All the formatting is applied in plain text commanded in supplementary files. The rendered results only when you open it in Microsoft word.

PDFs have a more complex source code, but they can be read as plain text with a program called RUPS.

Each web page is also fully described in a plain text file normally called `index.html`, visible by pressing `F12` in Firefox. This is a scaffolding document that contains the reference links to images and videos, stored in other placed on the server, to reference them when they're required.

***

## ASCII

I first learned about ASCII when I was 16 years old in November 2010 when I watched the TV miniseries: the [Andromeda Strain](https://en.wikipedia.org/wiki/The_Andromeda_Strain_(miniseries)) ripped from DVD onto my newly purchased iPhone 4. In one scene, a scientist decodes an alien message from a series of numbers. At the time, possessing zero knowledge of computers it seemed extremely complicated and I couldn't believe that in seeing a series of bits, it would occur to anyone to assume it was a text encoding. Of course, it now seems totally obvious as ASCII is so ubiquitous, that it could barely be considered "encoding" in any clandestine sense of the word.

ASCII was invented in 1963 for teleprinters and punch-cards. The data on the cards used to be read into a primitive 'RAM' equivalent by being slid between a conductive tape and a copper brush, or later via light sensors. See the following explanation for how they actually worked on [Reddit](https://www.reddit.com/r/explainlikeimfive/comments/1t4r0g/eli5_how_did_punch_cards_work_specifically_what/). They decided to use a separate character encoding lower and upper case, rather than adding shift-key modifier byte. A consequence we live with today as we still use ASCII to encode the entire English language today, as a subset of UTF-8.

> ASCII used 7 bits to represent each character i.e `0000000`→`1111111` (127) characters. Note that `100000000` (128) _is not_ available in ASCII, but `0` _is_, making for 128 characters in total.

The following are all the literal ASCII characters. The first 32 are the control characters. The line-break and carriage-return are visualized literally :

```
 !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ\[\\]^_\`abcdefghijklmnopqrstuvwxyz{|}~
```

The key point is that they made the numbers, letters and symbols start on a round-looking number in binary which was useful when looking at punch-cards:

 ASCII Decimal | Assigned to | Start With
-|-|-
0 to 31   | Control Codes |  `000`
32 to 47|  Symbols|   `010…`
48 to 63 |  Numbers|  `0110…`
64 to 97|  Capitals| `10…`
98 to 126 |  Lowercase| `11…`
127 | `DEL` Character |  `1111111`

[![Fichier:ASCII-Table-wide.svg](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/ASCII-Table-wide.svg/800px-ASCII-Table-wide.svg.png)](https://upload.wikimedia.org/wikipedia/commons/1/1b/ASCII-Table-wide.svg)

***

### ASCII Control Codes

The first 32 ASCII characters are invisible control characters. (Apart from the the line-break, tab and carriage-return).

Control codes were integrated into ASCII to directly drive physical tele-printers. These characters were made obsolete with the development of computer software, but they were retained for backward compatibility.
All the ASCII control codes other than from line-feed (`LF`), carriage-return (`CR`) and horizontal tab (`TAB`) are useless in modern text viewing software and are represented as boxes containing question marks, but are un-rendered in HTML.

All the control characters occupy a single byte in a string like any other character and remain in the string when saved to ram or disk memory. Different text editors and terminals visualize these control characters on screen differently. It is even visualized differently when between printing to python terminal between `print(▯)` which prints blank question boxes and `print(f'{▯'})` which prints the hex value escape sequence `\x▯▯` whereas Notepad++, Pycharm and VSCode show a box containing the control code abbreviation.For example:

- __Backspace: (`BS`)__: Used in a python string, it doesn't auto-resolve by deleting and canceling out the character before.
- __Carriage-Return (`CR`)__: Windows auto adds a following `LF` any time it is pasted from clipboard. Used in a python string, `CR` doesn't auto-resolve by deleting to the previous line-break. Although the terminal output of python or windows command line will actually interpret a `CR` as an instruction to overwrite previous characters on the line.

If you select and `ctrl+c` these characters from these programs, they are saved to windows clipboard like any other strings, but just show an error when you paste them into another program.

#### Typing ASCII Control Codes

14 ASCII of the control code characters remain type-able into python strings with a shorthand 'escape sequences', which involves preceding a letter or number with a backslash. This is a convention inherited from the c-programming language which was created in 1978. It was originally known as 'c-escape sequences'. Regular expression language 'RegEx' also inherited some of these expressions but calls them 'meta-characters'.

Writing the other ASCII control codes into a string in python requires you to use either:

- `"\x▯▯"` where `▯` is the hexadecimal number or,
- `chr(▯)` where `▯` is the decimal number.

Of these characters, only Horizontal Tab `\t`, Line-Feed `\n` and Carriage-Return `\r` are used in the modern world. These are the only ones which are printed back out into the python terminal as escape sequences rather than bytes.

|ASCII Number | Name | Often Visualized as… | C-Escape Sequence to Write into a Python String |  Python REPL: <br>`print(▯):` | Python REPL:<br> `print(f'{▯}')` |  Windows Command Line (when read from a file with `type file.txt`)
-|-|-|-|-|-|-
0→7|  Null → Acknowledge |`NULL`→ `ACK`| `\0`→`\6`|  `\x00`→`\x06`  | `\x00`→`\x06` | Various
7|Bell | `BEL` | `\a` or `\7`|``|`\x07`| Plays literal audio of `ping.wav`
8|Backspace | `BS`| `\b`|Deletes the character before| `\x08` | Nothing. Doesn't even delete the character before
9|Horizontal Tab| `TAB` or White-space|`\t`| White-space| `\t` | White-space
10|Line-Feed| Literal Line break or `LF`|`\n`|  A line break | `\n`| A literal line-break
11|Carriage-Return| Literal Line break or`CR` |`\r`| Deletes current line up to previous line-break and moves cursor there.|`\r`| Moves cursor to previous linebreak and starts typing there, overwriting current line.
12|Form-Feed | `FF`|`\f`| ``|`\x0c`| Shows ♀
13|Vertical Tab| `VT`|`\v`| ``|`\x0d` | shows ♂

#### ASCII Line-Break Character

Python  Windows and Linux write different newline characters by default in all new text files, unless you explicitly change the settings for each piece of software. If you copy into clipboard, it will automatically replace with the new type of line-break:

- Windows,   `\r\n`
- Mac OS X and Linux,  `\n`
- Mac (pre-OS X)  `\r`

Windows kept the  `\r\n`  for backward compatibility and lots of online protocols still use `\r\n` too. Macs updated from `\r` to `\n` with OS X.

The formatting you see when you open a file also depends on the program you use to read it. If you `echo` (a.k.a. print) a string containing `\r`  in the windows command line terminal, it will move the cursor back to the beginning of the line and start overwriting the text from there. But modern text editors (even notepad) now format the file according to the first instance of a line break in a file. If there is a mix of `\r\n`, `\r` and `\n`, you may see double-line breaks, or missing line-breaks.

To add to the confusion, there is also a Unicode code-point called "[Next Line](https://unicode-table.com/en/0085/) `NEL`" `U+0085`, literally pasted here:``. This character [was added in 1993](https://codepoints.net/U+0085?lang=en) and is redundant.

#### Coping with the Line-Break Inconsistency

Turn on `View` > `All symbols` in Notepad++ to view the symbols in a plain text file.

By default, Git software will __change__ the line-breaks in the file to default of your machine and then, push your local settings back to the remote repo. If you are collaborating, you should probably change Git config to leave default line endings using:
```git config --global core.autocrlf false```

You can also change in PyCharm to save files with`\n` and not auto-replace:
`Settings`>`Code Style` > `Line separator` > `Unix and macOS`. This means that a `\n` is saved to disk as the linefeed character, not the carriage return `\r\n`.

#### Typing Special ASCII Characters

Aside from the ASCII control codes, c and python use the following c-escape sequences to make-literal certain ASCII characters which otherwise have a special syntactical meaning:

C-Escape Sequence to Write into a Python String  | Character
-|-
`\\` | Backslash`\`
`\'` |Single quote `'`
`\"`| Double quote `"`
`\x▯▯`|Character with hex value `▯▯` (needed for other control codes)

***

## Extended ASCII

When computers replaced teleprinters, Americans companies started to use 8-bits characters. 8 Bits became known as a byte (or 'octet' as it still is known in French). Encoding a character with 8 rather than 7 bits, doubled the number of available characters to 256. As shown in the table below, the hexadecimal representation of a 1-byte character is highly convenient because 'ff' corresponds to 1 byte

Encoding | Bits per Character      | Number of Characters  | Number of Characters in Hexadecimal
 -- | ------------- | --------- | -------
 Original ASCII | 7   | 127     | 7f
 Extended ASCII | 8  | 255     | ff

In the new 8-bit encoding the first 128 chars were just the ASCII bits with a leading zero-bit. This practice is called "most-significant-bit zero numbering" (a.k.a. MSB 0). The second-half of the 8-bit character set (128-256) were encoded using a supplementary "code page", specific to the operating system. A number of different standards were used. They are collectively referred to as [Extended ASCII](https://en.wikipedia.org/wiki/Extended_ASCII) or [Code-pages](https://en.wikipedia.org/wiki/Code_page).

- First was IBM's [EBCDIC](https://en.wikipedia.org/wiki/EBCDIC) encoding used for mainframes from 1964.
- Then the "IBM Personal Computer" was released in 1981 with [Code Page 437](https://en.wikipedia.org/wiki/Code_page_437) which became the new standard for in the 80's.
- The [ANSI](https://en.wikipedia.org/wiki/American_National_Standards_Institute) organisation, the (American National Standards Institute) developed the [ANSEL](https://en.wikipedia.org/wiki/ANSEL) character-set in 1985. This has nothing to do with [Windows-1252](https://en.wikipedia.org/wiki/Windows-1252#Codepage_layout) (which later became known as the ANSI-character-set).
- The [ISO 8859-1 latin1](https://en.wikipedia.org/wiki/ISO/IEC_8859-1#Code_page_layout) code page was released in [1987](https://www.iso.org/standard/16338.html) and became the default encoding of HTTP documents. [Unicode](https://en.wikipedia.org/wiki/Unicode "Unicode") code-points 0-256 were inherited from [latin1](https://en.wikipedia.org/wiki/ISO/IEC_8859-1#Code_page_layout) with the exception of the code-points 128-159 which [latin1](https://en.wikipedia.org/wiki/ISO/IEC_8859-1#Code_page_layout) leaves undefined, and which Unicode inherited from the [C1 Control Codes](https://en.wikipedia.org/wiki/C0_and_C1_control_codes#C1_control_codes_for_general_use).
- Classic Mac OS used the [Mac OS Roman](https://en.wikipedia.org/wiki/Mac_OS_Roman) code page.  This code-page was replaced in 2001 by [UTF-8](https://en.wikipedia.org/wiki/UTF-8) with the release of [Mac OS X](https://en.wikipedia.org/wiki/Mac_OS_X) .
- Finally, [Windows-1252](https://en.wikipedia.org/wiki/Windows-1252#Codepage_layout) began to dominate as microsoft's market share grew and eventually replaced [ISO 8859-1 latin1](https://en.wikipedia.org/wiki/ISO/IEC_8859-1#Code_page_layout) as the HTTP with the release of HTML5 in 2008. It is identical to [latin1](https://en.wikipedia.org/wiki/ISO/IEC_8859-1#Code_page_layout) except for the code points 128-159 (0x80-0x9F) which [latin1](https://en.wikipedia.org/wiki/ISO/IEC_8859-1#Code_page_layout) leaves undefined and Windows-1252 assigns literal symbols.
- The [ANSI](https://en.wikipedia.org/wiki/ANSI_character_set) character-set is a [metonym](https://en.wikipedia.org/wiki/Metonymy)  that normally refers to Windows-1252. However, the name stems from a confusion whereby the phrase "ANSI Code Page" was used in Windows to refer to non-DOS encodings ANSI. The intention was that most of these would be [ANSI](https://en.wikipedia.org/wiki/ANSI "ANSI")-ISO standards such as [ISO-8859-1](https://en.wikipedia.org/wiki/ISO-8859-1 "ISO-8859-1"). But Windows-1252 was never an ANSI standard. Nevertheless "ANSI" is retained as an encoding option in Notepad++ where is means specifically the __Windows default__ encoding, used by non-Unicode programs (Windows-1252 for English installations).

Predictably, the diversity of code-pages grew to be a horrific mess of incompatibility.

> Please Note: From this point onward, each reference I make to __ASCII__, is specifically to __8-bit__ ASCII. Not the original 7-bit implementation.

***

## Unicode

Unicode is a consortium, incorporated in California in 1992 that tried to create an encoding that would supplant the need for having different Extended ASCII Code-pages between countries. Code pages limit each string to 1 encoding for characters with byte values 127-255, so you couldn't have a for example a full French and a full Greek alphabet in the same document.

Each unicode character is assigned to an integer number between `0` and `10FFFF` (`1,114,111`) called the __'code-point'__, typically written as a hexadecimal number proceeded by a U+… e.g. `a` is written as U+0061. As of Unicode version 14.0, there are only [144,697 characters assigned](https://unicode-table.com/en/blocks/).

They can be directly written into python strings. This is a valid string: "🗡🍡😳🌳".

Or you can type them into a python string using an escape sequence. This is the better option, as PowerShell cannot render many Unicode characters.

Escape Sequence to Write into Python | Character
-|-
`\u▯▯▯▯`|  Unicode Character for code-points from `0000` to `ffff` (hexadecimal numbers)
`\U▯▯▯▯▯▯▯▯`| Unicode Character for code-points `00000000` to `0010FFFF` (hexadecimal numbers)
`\o▯▯▯`| Unicode character with octal value `▯▯▯`
`\N{name}`|Character `name` in the Unicode database

Note that there are no code points above 1,114,111. `\0010FFFF` is the highest code-point.

### UTF-8

Unicode initially started in the 90s by using 16-bit characters with a null, padding byte preceding each Extended-ASCII character. I.e. `a` is encoded with a hex value of 0061 rather than just 61. But adding the padding zero doubles the memory required for writing English documents, and the 0-byte is the `NUL`  character, which in C, terminates the string and causes errors. To solve this, they created the "Unicode Transformation Format 8-bit" (UTF-8) encoding and algorithm.

The "Unicode-transformation-format 8-bit" (UTF-8) algorithm reads bytes on the basis that if the first bit(s) of the byte is/are:

- 0...  Its an 1 byte character (ASCII encoding)
- 10...  This is (normally) a continuation byte in a multi-byte character sequence
- 110...  This is the start of a 2 byte character
- 1110...  This is the start of a 3 byte character
- 11110...  This is the start of a 4 byte character

In other words, the __code-point__ is only the same as the bit-value for the ASCII characters, for all other characters, the code-point is different to the value of the bits. For example to encode Unicode code-points 128-255, UTF-8  adds a start-byte of value `194` or `195` , but the continuation bytes are identical to those in the [ISO 8859-1 latin1](https://en.wikipedia.org/wiki/ISO/IEC_8859-1#Code_page_layout) code-page. So if you encode [latin1](https://en.wikipedia.org/wiki/ISO/IEC_8859-1#Code_page_layout) characters with UTF-8 and then decode them with [latin1](https://en.wikipedia.org/wiki/ISO/IEC_8859-1#Code_page_layout), it will show the expected [latin1](https://en.wikipedia.org/wiki/ISO/IEC_8859-1#Code_page_layout) characters but they will each be preceded by either `Â` or `Ã` ([latin1](https://en.wikipedia.org/wiki/ISO/IEC_8859-1#Code_page_layout)  `194` and `195` respectively).

Beyond code-point 127 all characters are represented by either 2,3 or 4 bytes. UTF-8 stops at 4 bytes as there are no further code-points to be represented.

Unicode Code Point Number | Bytes per Character | Byte-Value = Code Point Value?
---|---|-
0 to 127 | 1 Byte | ✅Equal to Unicode and [Extended ASCII](https://en.wikipedia.org/wiki/Extended_ASCII) Code-Point
128 to 159 | 2 Bytes  | Second Byte-value Equal to Unicode and [C1 control codes](https://en.wikipedia.org/wiki/C0_and_C1_control_codes#C1_control_codes_for_general_use) Code-Point
160 to 255 | 2 Bytes | Second Byte-Value Equal to Unicode and [ISO-Latin1](https://en.wikipedia.org/wiki/ISO/IEC_8859-1#Code_page_layout) Code-Point  
255 to `U+07FF1`  | 2 Bytes | ❌
`U+0800` to `U+FFFF`| 3 Bytes | ❌
`U+10000` to `U+10FFFF` | 4 bytes | ❌

A comprehensive view of all the code-points is at [Unicode Table](https://unicode-table.com/en/blocks/)

***

## Other Unicode Encodings

### UTF-16 and UTF-32

Most computers, internally, apparently use UTF-16, although this uses more memory. UTF-16, is another variable width encoding which is 2-bytes for the entire basic-multilingual-plane ("BMP" a.k.a.  "plane 0"). It's worth mentioning now that characters _outside_ BMP include ancient scripts, mathematical symbols, musical symbols, and rarer Chinese, Japanese, and Korean (CJK) characters.

UTF-16 and -32 need a "[bytes order mark](https://en.wikipedia.org/wiki/Byte_order_mark)" (BOM) character at the beginning of the string to tell the encoding which way round the bytes are to be read. Big-end'ian (__BE__) strings uses a `U+FEFF` BOM and  little-end'ian (__LE__) use a `U+FFFE` BOM.

#### __`a`__ in each encoding

- UTF-8: `01100001`

- UTF-16 BE: `00000000 01100001`
- UTF-16 LE: `01100001 00000000`

- UTF-32 BE: `00000000 00000000 00000000 01100001`
- UTF-32 LE: `01100001 00000000 00000000 00000000`

### UTF-8, -16 and -32 Encodings Compared

 | | Fixed Width|Is also an Algorithm | String starts with Byte-Order-Mark `U+FEFF` or `U+FFFE` | Encodes 1-Byte Characters | Encodes 2-Byte Characters | Encodes 3-Byte Characters | Encodes 4-Byte Characters
-|-|-|-|-|-|-|-
UTF-8 | ❌|✅ | ❌ | ✅ ASCII (the Code-point equals the bit-value) |✅ Arabic, Hebrew, most European scripts (most notably excluding Georgian)|✅ Remainder of BMP (Plane 0)|✅ Beyond BMP characters (Planes 1 to 16)
UTF-16 | ❌|✅ | ✅ |❌|✅ BMP (a.k.a. Plane 0), (the Code-point equals the bit-value)|❌|✅ Beyond BMP Unicode characters (Planes 1 to 16)
UTF-32 | ✅|❌ | ✅ |❌|❌|❌|✅ For all planes, 0 to 16. The Code-point always equals the bit-value

UTF-8,  UTF-16 and UTF-32 are not compatible with each other. UTF-16 includes a null byte before each ASCII character and, UTF-32 includes 3 null bytes. So, if you'll be working mostly with ASCII characters, then UTF-8 is certainly more memory efficient. However, if you're working mostly with non-European scripts, using UTF-8 could be up to 1.5 times less memory efficient than UTF-16. When dealing with large amounts of text, such as large web-pages or lengthy word documents, this could impact performance.

> Q: The highest Unicode code-point is 10FFFF, a 21-bit binary number which could be represented by a 3-byte encoding system, a hypothetical "UTF-24". So why do we need 4-byte UTF-32?
>
A: Computers are generally much better at dealing with data on 4 byte boundaries. The benefits in terms of reduced memory consumption are relatively small compared with the pain of working on 3-byte boundaries.

## Obsolete Unicode Encodings

#### UTF-1

UTF-1 is a 1 to 5-byte variable width encoding, quickly obsolete and succeeded  by UTF-8. Reads ASCII but continuation bytes were not identifiable, precluding self-synchronisation.

#### UTF-7

UTF-7 is an Unicode encoding, once used for mail protocols which is obsolete as of 2020. It has been succeeded by UTF-8.

***

## The "UCS"

The ISO collaborated with the Unicode consortium in the 1990s. Historically the dominant force, they were swayed to follow the Unicode standard by voting pressure from software companies.

In their [UCS standard](https://www.iso.org/standard/69119.html), they regularly republish the Unicode character set which they call the "universal coded character set" "UCS". The difference between UCS and Unicode is that:

- The "UCS" refers specifically the characters and their code-points, it is not an encoding system.
- Unicode includes supplementary "rules for collation, normalization of forms, and the bidirectional algorithm for scripts like Hebrew and Arabic, whereas UCS does not.

## Obsolete ISO Encodings

The earlier ISO standards included the following encoding which are now superseded by UTF-16 and UTF-32 versions respectively, but you will find them referred to online which can be confusing:

#### UCS-2

Obsolete as of 2017. The first 2<sup>16</sup> characters of UTF-16 (only the 2 bytes per character versions). UCS-4 is still erroneously used, as a synecdoche for UTF-16.

#### UCS-4

Old name for UTF-32 (4 bytes per character).

***

## Unicode Combining-Characters & -Emoji

Some Unicode characters, when ordered sequentially, will combine, to render as a different, new characters. This allows [combining diacritical marks](https://en.wikipedia.org/wiki/Combining_Diacritical_Marks) for accented text and also changes to emoji such as skin tone.

Combining-characters are not listed on the Unicode character database as unique code-points but, they are in the Unicode standard. The combinations which have been widely adopted are known as "Recommended for General Interchange" (RGI). RGI includes all the diacritic combining characters and [national flags](https://emojipedia.org/emoji-flag-sequence/). It doesn't include certain other flags.

### Combining Characters

These [combining characters](https://en.wikipedia.org/wiki/Combining_character) must be placed __after__, not before the character they are modifying. If placed at the start of a string or after whitespace or incompatible characters, they will remain independent and not combine.

### National Flags

Flags can change and Unicode did not want to get involved in arguments related to nationhood. So, flags are not a code-point of their own, they are actually shown when two regional-indicator-symbol code-points are put in sequence, i.e. `DE` is Germany: 🇩🇪.

The following are the regional-indicator-symbols:
🇦 🇧 🇨 🇩 🇪 🇫 🇬 🇭 🇮 🇯 🇰 🇱 🇲 🇳 🇴 🇵 🇶 🇷 🇸 🇹 🇺 🇻 🇼 🇽 🇾 🇿

If these regional-indicator-symbols are placed directly next to each other according to the two-letter ISO [standard](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), they will combine to make an emoji.

### Emoji Sequences

There are [many ways to combine emojis](https://emojipedia.org/emoji-zwj-sequence/), to make other emojis, often involving a zero width joiner character, [`U+200D`](https://emojipedia.org/zero-width-joiner/).

👍  + [`U+200D`](https://emojipedia.org/zero-width-joiner/)  + 🏾 =  👍🏾

[👩](https://emojipedia.org/woman/) + [🏽](https://emojipedia.org/medium-skin-tone/) + [`U+200D`](https://emojipedia.org/zero-width-joiner/) + [🚀](https://emojipedia.org/rocket/)  = 👩🏽‍🚀

The cross symbol can also be overlaid onto any emoji by preceding with a zero-width joiner character: 🖕⃠

### Other flags

Pride flag is 🏳️ & `U+200D` & and 🌈 = 🏳️‍🌈

The following have not been "[Recommended for General Interchange](https://emojipedia.org/glossary/#rgi)". There are black flag followed a series of characters:

- England : 󠁧󠁢󠁳󠁣󠁴󠁿🏴󠁧󠁢󠁥󠁮󠁧󠁿
- Texas: 🏴󠁵󠁳󠁴󠁸󠁿
- Scotland: 🏴󠁧󠁢󠁳󠁣󠁴󠁿
- Wales: 🏴󠁧󠁢󠁷󠁬󠁳󠁿
- Northern Ireland: 🏴󠁧󠁢󠁮󠁩󠁲󠁿

***

### Key Points

A text file is just a string of characters, some of which are invisible and used for formatting (space, tab, line-break). In the global ubiquitous standard for encoding, "UTF-8", all the English language, formatting and punctuation characters, occupy 1 byte in memory (an integer value between 1 and 255, 8 bits in binary eg: 00000000).

In the "UTF-8" standard, characters are made up of 1 to 4 bytes with the continuation bytes starting with 10… .

All Unicode Characters have a code-point. A code-point is a unique  integer number, written in hexadecimal which is independent of the encoding.

Current encoding has room for has room for 1.1 million code points of which 144,697 are assigned a character as of version 14.0 published in 2021 September 14.

- [All characters](https://unicode-table.com/en/blocks/)
- [Recent emoji](https://unicode.org/emoji/charts-14.0/emoji-released.html)

***

### Resources

Talk: [Dylan Beattie Talk on Plain text NDC Oslo]( https://youtu.be/_mZBa3sqTrI?t=577)

Article: [Ned Batchelder](https://nedbatchelder.com/text/unipain.html)

Article: [Joel on Software](https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/)

[Clipboard viewer](https://freeclipboardviewer.com/windowsclipboard) is very useful for seeing what bytes are in the actual characters:

- As Windows uses UTF-16 internally, the text is represented as UTF-16, with the null, padding bytes preceding all ASCII.
- This program visualizes the ASCII bytes with leading zeros groups the bytes into 8 per row.
- The column on the left then lists the cumulative bytes in the string up to the start of that row, in hexadecimal base (16 bytes pe
