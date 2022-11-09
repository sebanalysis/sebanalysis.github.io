---
layout: post
title: Non-Decimal Integers
permalink: code/non-decimal-integers
category: 
tags: 
---

## Writing an Integer Variable

To write **integers** (not strings) of hex, octal, binary  into Python, or convert back to decimal, precede each integer with  `0x…` , `0o…` or `0b…` respectively or use a function.

Convert a decimal to another base:

- `…` Decimal, no modification needed just write the numbers without quotes (Default)
- `oct(…)` Octal
- `bin(…)` Binary
- `hex(…)` Hex
- `int(integer, base)`Write an integer of any base

Write a number of another base directly:

- `0o…` Octal
- `0b…` Binary
- `0x…` Hex

You will often see hex numbers represented in this way.

## Writing an integer into a string

If you want to write these into a string you need to use an f-string, i.e. `f"{0b...}"` as they are implicitly of integer type.

## Writing Byte Values Inside a String

The following to escape sequences are ways of representing the decimal an integer hex in or oct as bytes, inside  a string:

`\x▯▯` Where `▯▯` is a hexadecimal number up to `ff`

Note that `\▯▯▯`, where `▯▯▯` is an octal number, is a way to write a unicode character, not an octal number, into a string (there really is no `\o.\o`, its just `\`). It is just the octal version of `\u####` or`U########`.
