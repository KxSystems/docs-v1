.z.l (license)
==============

Returns the license information as a list of strings

    q).z.l
    ("8";"2007.09.01";"2007.09.01";,"1";,"1";,"1";,"0";"text #4NNNN")

the important fields are `(maxCoresAllowed;` `expiryDate;` `updateDate;` `...;` `bannerText)`

the bannerText is the custom text displayed at startup, and always contains the license number as the last token

.z.l is () for PLAY mode (non-commercial 32-bit versions 2.5 onwards).

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
