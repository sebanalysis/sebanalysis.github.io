---
layout: posts
title: Python f-Strings
permalink: code/f-strings
categories: Code
tags: 
---

Python f-string is the newest Python syntax to do string formatting. It is available since Python 3.6. Python f-strings provide a faster, more readable, more concise, and less error prone way of formatting strings in Python.

The best reference I have found is [Python-Reference](https://python-reference.readthedocs.io/en/latest/docs/str/format.html).

The f-strings have the `f` prefix and use `{}` brackets to evaluate values. Lets say we have a variable `a = 1456.9438385943894755`.

If no formatting is specified, python will print the number in general format to all figures of precision :

```
>>> f'{a}'
'1456.9438385943894755'
```

First add  `:` after the `a`. Everything you write after the colon represents the formatting of that number. Without formatting, the number remains as-is:

```
>>> f'{a:}'
'1456.9438385943894755'
```

Format | Action | Example
-|-|-
, or _ | add a separator to thousands | '1,456.9438385943895' or '1_456.9438385943895'
_20 | Adds padding space of `-` to start of the string if less than 20 chars long  | '__1456.9438385943895'
_<20 | Left-align and adds padding to the end of the string if less than 20 chars long | '1456.9438385943895__'
^20 | Centre-align with padding both sides |'1,456.9438385943895_'
.30 | Write 30 __significant figures__ to the string, by adding decimal places (not zero as float) |'1456.943838594389490026514977216720581055'
.2 | Write 2 __significant figures__ to the string by converting to scientific convention __if necessary__ | '1.5e+03'
e | Converts to scientific convention | '1.456944e+03'
.2e | Write 2 __decimal places__ in __scientific convention__ |'1.46e+03'
f | Does nothing -  already in decimal format | '1456.943839'
.2f | Write 2 __decimal places__ to the string| '1456.94'
% | format as a percentage | '145694.383859%'
.2% | percentage with 2 decimal places | '145694.38%'

When combining these characters, there is a certain order. Here is an example to explain it:
f'{a:_^20,.5e}' = '____1.45694e+03_____'

The order is: __[[fill]align][sign][#][0][width][,][.precision][type]__

- fill: `_` could have used the default, which is space by leaving out
- align: `^`
- sign: None
- #:  only valid for integers - prints the base
- width: `20`
- ,: `,` use comma separator
- .precision: `.5`
- type: `e` always comes last
