---
layout: post
title: Normalised Unicode Strings
permalink: code/normalised-unicode-strings
categories: code
tags:
---
Due to inconsistent use of combining characters, and alternate ways of  writing the same letter, Unicode developed ways of [normalising characters](https://en.wikipedia.org/wiki/Unicode_equivalence#Normalization), for comparison and consistency.

Unicode defines 2 [normalisation vectors](https://youtu.be/_mZBa3sqTrI?t=2081) for Unicode characters. Defined as follows:

1. Composition `…C` (can be done with un-canonsied characters) :
    1. Compose: squash down into smallest number of code points. I.e. , `a` + `U+0300`' `◌̀` ('[Combining Grave Accent](https://en.wikipedia.org/wiki/%CC%80)') +  is replaced by `à`.
    2. Decompose: stretch out into longest number of code-points, all the accents get spun out into combining characters, i.e. `à` is replaced by  `a` + `◌̀`.

2. Canon `…D` (always done in conjunction with either a full composed or fully decomposed string):
    1. Canonise `…K…`: Convert the code-point into the "canonical version" of the character. I.e. `²` becomes `2`.
    2. Leave un-canonised `…`:  Leave the character as-is

The french Wikipedia page, has [a better diagram](https://fr.wikipedia.org/wiki/Normalisation_Unicode) to show what "Composition" and "Canon" do.

These two methods provide a matrix of 4 possible normalised forms of unicode strings, with the crypic names "NFC", "NFD", "NFKC", "NFKD":

 Normalised Forms |Composed | Decomposed
-|-|-
__Non-Canonical__ | `NFC` | `NFD`
__Canonical__ | `NFKC` | `NFKD`

The function `unicodedata.normalize( "form", "string" )` takes one of these four normalisation forms as an arguement and returns a normalised string.

***

## Examples

Lets compare some characters after applying the 4 different normalisation methods. Are the strings equal?

First import the `unicodedata` module from the standard library:

```python
import unicodedata as uc
```

The 4 normalised-forms:

```python
NF = ["NFC", "NFD", "NFKC", "NFKD"]
```

Using the comparison `a == A` as an example.

```python
>>>for x in NF: x ,uc.normalize( x  ,  "a") == uc.normalize( x  ,  "A")
...
('NFC', False)
('NFD', False)
('NFKC', False)
('NFKD', False)
```

***

### Different Capitalisation `a == A`

Unnormalised, `a ≠ A`

Shown more clearly with both characters normalised in the same way:

 __`a == A`__ |Composed | Decomposed
-|-|-
__Non-Canonical__ | `NFC`❌ | `NFD`❌
__Canonical__ | `NFKC` ❌ | `NFKD` ❌

The `.normalize` method, has no effect on case. Have to use the`.lower()` method on both strings to do a case insensitive comparison.

***

### Different Form of Same "Canonical" Character:   __`① == 1`__

Unnormalised, `① ≠ 1`

With both characters normalised in the same way and ignoring the code:

 __`① == 1`__ |Composed | Decomposed
-|-|-
__Non-Canonical__ | `NFC`❌ | `NFD`❌
__Canonical__ | `NFKC` ✅ | `NFKD` ✅

`①`and`1` are the same 'canonical' character despite being different code-points.

***

### Different Form of Same "Canonical" Character:    __`y == 𝒚`__

Unnormalised, `y ≠ 𝒚`

With both characters normalised in the same way:

__`y == 𝒚`__ |Composed | Decomposed
-|-|-
__Non-Canonical__ | `NFC`❌ | `NFD`❌
__Canonical__ | `NFKC` ✅ | `NFKD` ✅

`y`and`𝒚` are the same 'canonical' character  despite being different code-points.

However, for information: __`ß ≠ SS`__ and __`a ≠ α`__.

***

### Composed vs Decomposed Letter:  `à  == ◌̀ + a`

Unnormalised, `à  ≠ ◌̀ + a`

with both characters normalised in the same way:

__`à  == ◌̀ + a`__ |Composed | Decomposed
-|-|-
__Non-Canonical__ | `NFC`✅ | `NFD`✅
__Canonical__ | `NFKC` ✅| `NFKD` ✅

In composed form, `a + ◌̀`  becomes `à`.  When decomposed, `à` becomes `a + ◌̀`. So they are always the same characters.

### Resources

Talk: [Dylan Beattie Talk on Plain text NDC Oslo](https://youtu.be/_mZBa3sqTrI?t=2066)
