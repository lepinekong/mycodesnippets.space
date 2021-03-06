Red [
    Title: "dataviz.red"
    .links: [
        {Inspiration} https://www.lightpetal.com/vouchercodes-persona-decals-and-cards/
    ]    
]

Article: [

    Title: {datavizualisation}

    Source: [
        .title: {ReAdABLE Source [(What is the ReAdABLE Human Format?)](http://readablehumanformat.com)}
        .text: {[http://mycodesnippets.space/redlang/draw/dataviz.red](https://github.com/lepinekong/mycodesnippets/blob/master/redlang/draw/dataviz.red)
        }
        .Published-Url: http://mycodesnippets.space/redlang/draw/dataviz
    ]  


    demo: [
        .title: {Demo}
        .text: {Type in [red-lang](https://www.red-lang.org/p/download.html) console: }
        .quote: {do https://mycodesnippets.space/redlang/draw/src/dataviz.red}
        .image: https://i.imgur.com/Dlj8xFp.png
    ]      
    
    code-snippet: [

        .title: {Code Snippet}
        .image: https://i.imgur.com/dl45eRJ.png
        .links: [
            {View source} https://github.com/lepinekong/mycodesnippets/blob/master/redlang/draw/src/dataviz.red
            {Copy source} https://raw.githubusercontent.com/lepinekong/mycodesnippets/master/redlang/draw/src/dataviz.red
        ]        
        .code/red: {
transparent: 255.255.255.255
color-1: 190.220.230
color-2: 63.181.229

font-title: make font! [ name: "Lucida Sans" size: 14 color: white style: 'bold]

dataviz: layout compose/deep [
    title {Data Visualization}
    backdrop white
    img: panel white [
        origin 0x0 space 0x0
        across
        panel white [
            origin 0x0 space 0x0
            panel white [
                origin 0x0 space 0x0
                at 20x0 base 120x120 white draw [
                        pen off
                        fill-pen (color-1)
                        circle 60x60 60 ; circle center radius
                        fill-pen (color-2)
                        arc 60x60 60x60 -90 65 closed ; arc <center> <radius> <begin> <sweep> closed; 18/100 * 360 = 65° sweep
                ]  
                at 85x15 base 92x92 (transparent) 
                "18%" white bold font-size 14 left wrap 
            ]
            return
;             base 160x80 white bold wrap font (font-title) 111.111.111 
; {
; PERCENTAGE OF
; CUSTOMER BASE}    
return pad 0x20
text 170x50 white bold center wrap font (font-title) 111.111.111 
{PERCENTAGE OF CUSTOMER BASE}              
        ]
        
        panel white [
            origin 0x0 space 0x0
            panel white [
                origin 50x0 space 0x0
                base 120x120 white draw [
                        pen off
                        fill-pen (color-1)
                        circle 60x60 60 ; circle center radius
                        fill-pen (color-2)
                        circle 60x60 46
                ]
                at 64x14 base 92x92 (transparent) 
                "$100K" white bold font-size 16 middle wrap
            ]
            return
;             base 220x80 white bold wrap font (font-title) 111.111.111 
; {
; ANNUAL HOUSEHOLD
; INCOME} 

return pad 0x20
text 220x50 white bold center wrap font (font-title) 111.111.111 
{ANNUAL HOUSEHOLD INCOME}  
        ]
    ]   

    return

    panel white [
        button "save" [
            img-out: to-image img
        ]
    ]
]

view dataviz

if value? 'img-out [
    save/as %dataviz.png img-out 'png
    print ["dataviz.png saved in" clean-path %./]
]

        }

    ]
]

do read http://readablehumanformat.com/lib.red
markdown-gen 