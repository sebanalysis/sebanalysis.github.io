---
layout: posts
---
<script type="text/javascript" id="MathJax-script" async
  src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js">
</script>

"Floats" or "Floating Point Numbers", are approximations of decimal numbers, using binary notation.

In mathematics, we commonly write long or short decimal numbers in the form:

$$ \pm x {\cdot }10^{\pm y} $$

But in all computers, this is automatically converted into in binary. Specifically, it is stored in the form:

$$ \pm x {\cdot } 2^{\pm y} $$

Where:

𝒙 : The __Significant__ (a.k.a. the "mantissa" pre-1950's) is limited to 52 bits.

𝒚 : The __Exponent__ is limited to 11 bits.

The bit representation is stored in the the following format called "IEEE_745" a.k.a. "float64", "Binary64" or, "double-precision" (as it is double the length of the 32 bit representations used on older computers).

![](https://filedn.eu/ldJhAY64zF58aVds1pK8ovH/IEEE_754_Double_Floating_Point_Forma.svg)

<div align="center">Float Representation in memory in "float64"</div>

__Note__ there is a further complication:

- The __Exponent__  is encoded using the "offset-binary" scheme. In  "offset-binary", the sign is implicit, and does not require an extra bit to be expressed.
- The __Significant__ is encoded literally, hence the need for the sign at the beginning of the expression.

"float64" (provides __between 15__ and __17 significant decimal digits__ of precision and is the standard used in python.

"float32" provides from 6.92 (for values 1 to 2) up to __7.22__ decimal digits of precision (for 2<sup>24</sup>,  $$ \log_{10}\left(2^{24} \right ) = 7.22 $$. Above which there is a fixed interval error of 1)

The limitations of binary float representation are :

- When checking equality between seemingly equivalent values and finding `False`
- When more that 15 significant decimal digits are needed.

### Resources

[Tom Scott](https://www.youtube.com/watch?v=PZRI1IfStY0)
