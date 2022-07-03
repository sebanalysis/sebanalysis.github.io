---
layout: post
title: Non-Decimal Integers
permalink: Non-Decimal Integers
date: 2022-07-01
category: 
tags: 
---
# Non-Decimal Integers

## Writing an Integer

To write **integers** (not strings) of hex, octal, binary  into Python, or convert back to decimal, precede each integer with  `0x…` , `0o…` or `0b…` respectively or use a function.

If you want to write these into a string you need to use an f-string, i.e. `f"{0b...}"` as they are implicitly of integer type:

- `…` Decimal, no modification needed (Default)
- `0o…` or `oct(…)` Octal
- `0b…`  or `bin(…)` Binary
- `0x…` or `hex(…)` Hex
- `int(integer, base)`Write an integer of any base

## Writing Byte Values Inside a String

The following to escape sequences are ways of representing the decimal an integer hex in or oct as bytes, inside  a string:

`\o▯▯▯` Where `▯▯▯` is an octal number
`\x▯▯` Where `▯▯` is a hexadecimal number up to `ff`
