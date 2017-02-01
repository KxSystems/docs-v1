Q has four object types: noun, function, verb and adverb:

    q)sales:2 7 1 8                 / noun sales

    q)sum sales                     / function sum
    18

    q)sales * 10                    / verb *
    20 70 10 80

    q)sales */: 2 10                / adverb /:
    4  14 2  16
    20 70 10 80

Verbs differ from functions in that they may be called (and typically are called) with arguments to left and right. A verb may also be called with both arguments on the right, as in:

    q)*[sales;10]
    20 70 10 80

*Remark:* in some kdb+/q texts, the terms verb and function are used interchangeably, with qualifiers to indicate whether arguments are on the right, or to the left and right. Instead, this reference distinguishes verb from function.

*Remark:* q has no ambivalent functions, unlike the underlying k language.
