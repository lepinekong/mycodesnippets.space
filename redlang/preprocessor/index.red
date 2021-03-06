Red [
    Title: "redlang preprocessor"
]

Article: [

    Title: {Index of redlang preprocessor code snippets}

    Source: [
        .title: {ReAdABLE Source}
        .text: {[http://mycodesnippets.space/redlang/preprocessor/index.red](https://github.com/lepinekong/mycodesnippets/blob/master/redlang/preprocessor/index.red)
        }
        .Published-Url: http://mycodesnippets.space/redlang/preprocessor/index
    ]   

    Introduction: [
        .title: {Introduction}
        .text: {The Red preprocessor transforms code during, after the LOADing phase. Transformations are achieved by inlining preprocessor keywords (called directives) inside Red source code.
        }
        .links: [
            {Official documentation} https://doc.red-lang.org/en/preprocessor.html
        ]
    ] 

    Example-1: [
        .title: {Basics}
        .text: {Replace "," by " "}
        .text: {For demo type in Red Console}
        .quote: {do read http://mycodesnippets.space/redlang/preprocessor/src/basics.red}
        .text: {then type:}
        .quote: {[1,2,3,abd,"hello"]}
        .text: {You should get this:}
        .image: https://i.imgur.com/wpGH6G1.png     
        .text: {Source code: }  
        .image: https://i.imgur.com/NYKUJlk.png  
        .links: [
            {View source} https://github.com/lepinekong/mycodesnippets/blob/master/preprocessor/src/example1.red
            {Copy source} https://raw.githubusercontent.com/lepinekong/mycodesnippets/master/preprocessor/src/example1.red
        ]                
        .code: {
system/lexer/pre-load: func [src part][
    parse src [
        any [
            remove comma insert #" " | skip
        ]
    ]
]
do {
    block: [1,2,3,abd,"hello"] 
    ?? block
}           
        }
    ]

    Example-2: [
        .title: {Code in french}
        .text: {For demo type in Red Console}
        .quote: {do read http://mycodesnippets.space/redlang/preprocessor/src/red-in-french.red}
        .text: {then type:}
        .quote: {i: 10 while [i > 0][si even? i [print i] i: i - 1]}
        .text: {You should get:}
        .image: https://i.imgur.com/GW41yg9.png
        .text: {Then type the instruction in french}
        .quote: {i: 10 tant que [i > 0][si impair? i [affiche i] i: i - 1]}
        .text: {check that it also works:}
        .image: https://i.imgur.com/JtgfwaZ.png    
        .text: {Source code: }  
        .image: https://i.imgur.com/NYKUJlk.png  
        .links: [
            {View source} https://github.com/lepinekong/mycodesnippets/blob/master/preprocessor/src/example2.red
            {Copy source} https://raw.githubusercontent.com/lepinekong/mycodesnippets/master/preprocessor/src/example2.red
        ]          
        .code: {
system/lexer/pre-load: function [src part][
    parse src [
        any [
            s: [
                "affiche"       (new: "print")
                | "si"          (new: "if")
                | "tant que"    (new: "while")
                | "pair?"       (new: "even?")
                | "impair?"     (new: "odd?")
            ] e: (s: change/part s new e) :s
            | skip
        ]
    ]
]

do {i: 10 tant que [i > 0][si impair? i [affiche i] i: i - 1]}            
        }
    ]
]

do read http://readablehumanformat.com/lib.red
markdown-gen

system/lexer/pre-load: func [src part][
    parse src [
        any [
            remove comma insert #" " | skip
        ]
    ]
]
do {block: [1,2,3,abd,"hello"] ?? block} 


system/lexer/pre-load: function [src part][
    parse src [
        any [
            s: [
                "affiche"       (new: "print")
                | "si"          (new: "if")
                | "tant que"    (new: "while")
                | "pair?"       (new: "even?")
                | "impair?"     (new: "odd?")
            ] e: (s: change/part s new e) :s
            | skip
        ]
    ]
]

do {i: 10 tant que [i > 0][si impair? i [affiche i] i: i - 1]}
