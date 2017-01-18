An adverb is any function where the [x](Reference/glossary#x "wikilink") parameter is a function. The primitive adverbs are `'` `/` `\` `':` `/:` `\:`.

| |symbol                                     | name                                |
|---------------------------------------------|-------------------------------------|
| ['](Reference/Apostrophe "wikilink")        | [each](Reference/each "wikilink")   |
| [/](Reference/Slash "wikilink")             | [over](Reference/over "wikilink")   |
| [\\](Reference/BackSlash "wikilink")        | [scan](Reference/scan "wikilink")   |
| |[':](Reference/ApostropheColon "wikilink") | [prior](Reference/prior "wikilink") |
| [/:](Reference/SlashColon "wikilink")       | each right                          |
| [\\:](Reference/BackSlashColon "wikilink")  | each left                           |

For convenience, q defines the adverbs [each](Reference/each "wikilink"), [over](Reference/over "wikilink"), [scan](Reference/scan "wikilink") and [prior](Reference/prior "wikilink") (corresponding to the adverbs `'` `/` `\` `':`).

There should be no whitespace between a primitive adverb and its x argument when using the form `x/`, `x'`, etc

Example
-------

    q)reverse (1 2 3;"hello")
    "hello"
    1 2 3

    q)reverse each (1 2 3;"hello")        / adverb each
    3 2 1
    "olleh"

    q)1 2 3 , 100 200 300
    1 2 3 100 200 300

    q)1 2 3 ,' 100 200 300                / adverb ' (each-both)
    1 100
    2 200
    3 300

See also
--------

[each](Reference/each "wikilink"), [over](Reference/over "wikilink"), [scan](Reference/scan "wikilink") and [prior](Reference/prior "wikilink")
