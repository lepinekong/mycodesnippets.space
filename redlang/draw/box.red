Red [
    Title: "box.red"
]

Article: [

    Title: {How to draw colored boxes in Red}

    Source: [
        .title: {ReAdABLE Source [(What is the ReAdABLE Human Format?)](http://readablehumanformat.com)}
        .text: {[http://mycodesnippets.space/redlang/draw/box.red](https://github.com/lepinekong/mycodesnippets/blob/master/redlang/draw/box.red)
        }
        .Published-Url: http://mycodesnippets.space/redlang/draw/box
    ]  


    demo: [
        .title: {Demo}
        .text: {Type in [red-lang](https://www.red-lang.org/p/download.html) console: }
        .quote: {do read http://mycodesnippets.space/redlang/draw/src/box.red}
        .image: https://i.imgur.com/7YFT2mm.png
    ]      
    
    code-snippet: [

        .title: {Code Snippet}
        .image: https://i.imgur.com/JMCfgIg.png
        .links: [
            {View source} https://github.com/lepinekong/mycodesnippets/blob/master/redlang/draw/src/box.red
            {Copy source} https://raw.githubusercontent.com/lepinekong/mycodesnippets/master/redlang/draw/src/box.red
        ]        
        .code/red: {
title: "How to draw gradient colored rounded boxes (rectangles)"
dark-blue: 1.23.64
light-blue: 104.172.248
light-magenta: 170.164.234

bigRect-pos1: 0x0
bigRect-pos2: 640x480

smallRect-pos1: 100x100
smallRect-pos2: make pair! compose [(bigRect-pos2/1 - smallRect-pos1/1) (bigRect-pos2/2 - smallRect-pos1/2)]

microRect-pos1: 200x200
microRect-pos2: make pair! compose [(bigRect-pos2/1 - microRect-pos1/1) (bigRect-pos2/2 - microRect-pos1/2)]


win: compose/deep [

    title (title)

    origin 0x0 space 0x0

    base (bigRect-pos2)
    draw [

        pen off ; will remove black border for shapes

        fill-pen (dark-blue) 
        box (bigRect-pos1) (bigRect-pos2) 20

        fill-pen linear (dark-blue) (light-blue) 0x0 800x0
        box (smallRect-pos1) (smallRect-pos2) 20

        fill-pen linear (red) (light-magenta) 0x0 600x0
        box (microRect-pos1) (microRect-pos2) 20
    ]

]

view layout win


        }

    ]

    References: [
        .title: {References}
        .links:[
            https://doc.red-lang.org/en/draw.html#_box
            https://doc.red-lang.org/en/draw.html#_linear_gradient_pen
            http://helpin.red/Colorgradientsandpatterns.html
        ]
    ]
]

do read http://readablehumanformat.com/lib.red
markdown-gen 