{-# LANGUAGE OverloadedStrings #-}

module Stylesheets
    ( mainStylesheet
    ) where

import Clay
import qualified Clay.Flexbox as Flexbox (flex, wrap)
import qualified Clay.Media as Media
import Prelude hiding (rem, (**))

rootFontSize = px 12
rootFontName = "Raleway"
-- fontName = "Amatic SC"

secondaryFontName = sansSerif

-- FIXME: дожна коррелировать с высотой навигационной панели 
navbarHeight = px 95
navbarHPadding = pct 10
-- navbarColor = rgb 251 166 40
navbarColor = rgb 255 102 0

mainStylesheet :: Bool -> Css
mainStylesheet debug = do
    let debugIt borderC backgroundC = 
            if debug 
                then border solid (px 1) borderC >> backgroundColor backgroundC
                else border inherit inherit inherit >> backgroundColor inherit
        debugBorder = flip debugIt $ inherit
        debugBack = debugIt inherit

    -- let debugBack c = 
    --     if debug then backgroundColor c else backgroundColor inherit
    importUrl "../fonts/raleway/raleway.css"

    -- Для корректной прокрутки разделов (из доки bootstrap scroll-spy) 
    body ? do
        fontSize rootFontSize 
        fontFamily [rootFontName] [secondaryFontName]

    "#p2" ? debugBack green
    "#p3" ? debugBack blue
    "#p4" ? debugBack yellow

    "#start-page" ? do
        -- debugBorder blue 

        height $ vh 100

        background $ rgba 0 0 0 0.3

        display flex
        justifyContent center
        alignItems center

        paddingTop nil


        header ? do

            -- marginTop $ pct (-10)
            width (pct 70)

            h1 ? do
                -- debugBorder gray

                textAlign center
                fontSize $ em 4
                fontWeight $ weight 600
                paddingBottom $ px 10
                lineHeight $ em 1.5

                -- color $ lightgoldenrodyellow
                color $ lightgray

            h2 ? do
                -- debugBorder blue

                display flex

                paddingBottom $ px 14

                -- color $ setA 0.7 navbarColor
                color navbarColor
                fontWeight $ weight 600

                p ? do
                    -- debugBorder green

                    marginLeft auto
                    marginRight auto
                    textAlign center

                    width $ pct 100

                    fontSize $ em 2.5

            -- h2 ** ul ? do
            --     -- debugBorder green

            --     marginLeft auto
            --     marginRight auto

            --     display flex
            --     width $ pct 100
            --     justifyContent center

            --     fontSize $ em 2

            --     li ? do
            --         paddingLeft $ px 15
            --         paddingRight $ px 15

                    display inlineBlock
        "video" ? do
            position absolute
            left nil
            top nil
            width $ pct 100
            -- maxHeight $ pct 100
            minHeight $ pct 100
            zIndex (-1)
            "object-fit" -: "cover"

    "#navbar" ? do 
        -- debugBorder green

        display flex
        alignItems center
        justifyContent spaceBetween

        position fixed
        top nil
        right nil
        left nil

        paddingLeft navbarHPadding
        paddingRight navbarHPadding

        color navbarColor
        fontWeight $ weight 600

        backgroundColor $ rgba 255 255 255 0.8

        fontSize $ em 1.2
        -- fontWeight bold
        textTransform uppercase

        transition "background-color" (sec 1.5) linear (sec 0)

        ".no-background" & do
            backgroundColor transparent

    ".navbar-nav" ? do
        display flex
        alignItems center
        justifyContent spaceBetween

        width (pct 40)

        li ? do
            borderColor navbarColor
            borderBottomWidth $ px 1

            paddingBottom $ px 8
            paddingTop $ px 8

        li # ".active" ? do
            borderColor navbarColor
            borderBottomWidth $ px 1
            borderStyle solid
            color red

        a ? do
            textDecoration none
            color navbarColor


    ".navbar-phone" ? do
        fontSize $ rem 1.8

    ".navbar-toggle" ? do
        display none
        borderStyle none
        color navbarColor
        backgroundColor transparent
        fontSize $ rem 1.8
        cursor pointer

    ".page-start-button" ? do
        display flex
        width (pct 100)
        justifyContent center
        marginTop (em 2)

        fontSize $ em 1.5

        "a" ? do
            width (pct 38)
            sym padding (px 15)

            backgroundColor $ rgba 255 102 0 0.7
            sym borderRadius $ px 20

            textAlign center
            color white
            textTransform uppercase
            textDecoration none

        "a" # ":hover" ? do
                backgroundColor $ rgba 265 117 0 0.7

    ".callback-button" ? do
        display flex
        width (pct 100)
        justifyContent center
        alignItems center

        fontSize $ em 2

        "a" ? do
            width (pct 50)
            sym padding (px 15)

            backgroundColor $ rgb 255 102 0 
            sym borderRadius $ px 20

            textAlign center
            color white
            textTransform uppercase
            textDecoration none

        "a" # ":hover" ? do
                backgroundColor $ rgba 265 117 0 0.7


    query Media.screen [Media.maxWidth $ px 1280] $ do
        "#navbar" ? do
            paddingLeft $ px 20
            paddingRight $ px 20

        ".brand" ? do
            transform $ scale 0.7 0.7

    -- query Media.screen [Media.maxWidth $ px 835] $ do
    query Media.screen [Media.maxWidth $ px 900] $ do
        ".navbar-nav" ? do
            width (pct 80)

        ".navbar-phone" ? do
            display none

        "#start-page" ? do
            display block


            header ? do
                display flex
                flexDirection column
                height $ pct 100
                textAlign center

                backgroundColor $ rgba 0 0 0 0.4


                marginTop nil
                paddingTop (navbarHeight @+@ (px 60))

                h1 ? do
                    fontSize $ em 2.4
                    color $ lightgoldenrodyellow
                    color $ lightgray

                p ? do
                    -- debugBorder green

                    marginLeft auto
                    marginRight auto
                    textAlign center

                    width $ pct 100

                    fontSize $ em 2.5


                -- h2 ** ul ? do
                --     -- debugBorder green

                --     marginLeft auto
                --     marginRight auto

                --     display flex
                --     flexDirection column
                --     width $ pct 100

                --     li ? do

                --         display inlineBlock
                --         textAlign center
                --         sym2 padding (px 20) nil 

        ".page" ? do

            h1 ? do

                fontSize $ rem 1.2
                textTransform uppercase
                lineHeight $ unitless 1.5

            h2 ? do

                fontSize $ rem 1

        ".cards" ? do
            display grid
            "grid-template-columns" -: "auto auto"
            "grid-template-rows" -: "auto auto"
            -- flexWrap Flexbox.wrap
            -- justifyContent spaceAround

        "#p1" ?
            ".cards" ? do
                "grid-template-columns" -: "auto auto auto auto"

        ".page-callback" ? do
            backgroundImage $ url "../img/callback-background.jpg"

            ".cards" ? do
                "grid-template-columns" -: "auto auto auto auto"

            ".phone" ? do
                fontSize $ em 1.6
                textAlign center
                fontSize $ em 4


        "#p2" ? 
            ".cards" ? do
                "grid-template-columns" -: "auto auto auto"

    query Media.screen [Media.maxWidth $ px 480] $ do

        "#navbar" ? do

            ".navbar-nav" ? do
                display none

            ".navbar-nav" # ".active" ? do
                display block

                position absolute
                left $ px 0
                top $ navbarHeight @-@ (px 1)
                width $ pct 80
                paddingTop $ px 10
                paddingBottom $ px 10

                backgroundColor $ rgba 0 0 0 0.8

                li ? do
                    width $ pct 100
                    sym2 padding (px 20) (px 20)

                    borderStyle none

                    fontSize $ rem 1.2

            ".navbar-toggle" ? do
                display inlineBlock

        ".page" ? do

            h1 ? do
                paddingLeft $ px 60
                paddingRight $ px 60
                paddingBottom nil

                fontSize $ rem 1
                lineHeight $ unitless 1.5

            h2 ? do
                fontSize $ rem 1

        ".cards" ? do

            display flex
            flexDirection column
            justifyContent spaceAround
            alignItems center

            width $ pct 100
            -- maxWidth $ px 1400
            paddingTop $ px 5
            paddingBottom $ px 15

        ".card" ? do 
            width $ pct 90
            maxWidth $ px 360
            -- height $ px 400
            height auto

            borderColor navbarColor
            borderWidth $ px 4
            borderStyle solid

            sym2 margin (px 10) (px 5) 

            p ? do
                paddingLeft $ px 10
                paddingRight $ px 10



    ".page" ? do
        -- debugBack yellow

        paddingTop (navbarHeight @+@ (px 5))
        paddingBottom (navbarHeight @+@ (px 5))

        width $ pct 100
        -- height $ vh 100

        display flex
        flexDirection column
        alignItems center

        h1 ? do
            -- debugBorder

            sym2 padding inherit (px 15)
            paddingTop $ px 15

            fontSize $ rem 2
            textTransform uppercase
            lineHeight $ unitless 1.5

            textAlign center

        h2 ? do
            -- debugBorder

            sym padding $ px 15

            fontSize $ rem 1.6
            textTransform uppercase

            color $ rgba 0 0 0 0.5

            textAlign center

    ".cards" ? do
        display grid
        -- flexWrap Flexbox.wrap
        justifyContent center
        "grid-template-columns" -: "auto auto"
        "grid-column-gap" -: "20px"
        "grid-row-gap" -: "20px"

        width $ pct 100
        -- maxWidth $ px 1000
        paddingTop $ px 5
        paddingBottom $ px 15

    "#p1" ? do
        backgroundColor $ rgb 237 242 247

        ".cards" ? do
            "grid-template-columns" -: "auto auto auto auto"

    ".page-callback" ? do
        backgroundImage $ url "../img/callback-background.jpg"

        ".phone" ? do
            fontSize $ em 1.6
            textAlign center
            fontSize $ em 4
            color navbarColor
            paddingTop $ px 20
            paddingBottom $ px 20

    "#p2" ? do
        backgroundColor $ rgb 237 242 247
        ".cards" ? do
            "grid-template-columns" -: "auto auto auto"

    "#services" ? do
        -- backgroundColor $ rgb 237 242 247
        -- height $ px 1000

        header ? do
            h2 ? do
                color navbarColor
                fontSize $ em 2

        ".cards" ? do
            "grid-template-columns" -: "auto auto auto"

    "#sites" ? do
        backgroundColor $ rgb 237 242 247
        -- height $ px 1000

        ".cards" ? do
            "grid-template-columns" -: "auto auto auto"

    "#accounting" ? do
        -- backgroundColor $ rgb 237 242 247
        -- height $ px 1000

        ".cards" ? do
            "grid-template-columns" -: "auto auto auto"

    "#profit" ? do
        backgroundColor $ rgb 237 242 247

    "#footer" ? do
        -- borderStyle solid
        -- borderColor green
        -- borderWidth $ px 0.1

        paddingLeft (pct 10)
        paddingRight (pct 10)
        paddingTop (px 40)
        paddingBottom (px 40)

        display flex
        flexDirection row

        height $ px 200

        -- "div" <? do
        --     borderStyle solid
        --     borderColor red
        --     borderWidth $ px 0.1

        "div" # ":fist-child" ? do
            width $ pct 20
            alignItems center
            justifyContent center

        "div" # (nthChild "2") ? do
            Flexbox.flex 1 0 auto
            display flex
            alignItems center
            justifyContent center

            fontSize $ rem 1.1

        "div" # nthChild "3" ? do
            width $ pct 20

            display flex
            sym padding $ px 20
            alignItems center
            justifyContent center


            figure ? do
                -- borderStyle solid
                -- borderColor black
                -- borderWidth $ px 0.1
                height $ pct 100
                display flex
                alignItems center
                justifyContent center
                marginRight $ px 20


                img ? do
                    height $ pct 60
                    width $ px 60
                    -- marginLeft $ px 40

            -- figure # firstChild ? do
            --     borderStyle solid
            --     borderColor red
            --     borderWidth $ px 0.1




        ".social-links" ? do
            display flex
            flexDirection row



    ".social-card" ? do
        backgroundColor $ rgb 237 242 247
        -- width $ px 370
        display flex
        justifyContent spaceAround
        alignItems center
        height $ pct 100

        backgroundColor white

        sym borderRadius $ px 4
        boxShadow $ pure $ bsColor (rgba 0 0 0 0.2) $ shadowWithBlur nil (px 2) (px 2)

        a ? do
            display flex
            justifyContent spaceAround
            alignItems center
            height $ pct 100

            textAlign center
            textDecoration none

        figure ? do
            height $ px 70
            width $ px 100
            display flex
            justifyContent center
            alignItems center
            borderRightWidth $ px 1
            borderRightStyle solid
            borderRightColor $ rgb 234 234 234

            img ? do
                height $ px 35
                width auto
                maxWidth $ px 40

            img # ".bigger" ? do
                height $ px 50
                maxWidth $ px 100


        ".social-name" ? do
            textTransform uppercase
            width $ px 270
            sym2 padding (px 10) nil
            textAlign center


    ".card" ? do 
        width $ px 280
        height $ px 400

        borderColor navbarColor
        borderWidth $ px 4
        borderStyle solid

        sym2 margin (px 5) nil

        display flex
        flexDirection column
        alignItems center


        sym padding $ px 10

        hgroup ? do

            -- FIXME пересекается с правилом выше надо делать a > b
            paddingTop $ px 0
            paddingBottom $ px 0

            figure ? do
                textAlign center
                img ? do
                    width $ pct 70

            h1 ? do
                fontSize $ em 1.6
                fontWeight bold
                paddingTop $ px 15
                textAlign center

        p # ":first-of-type" ? do
            debugBorder green
            paddingTop $ px 15

        p ? do
            fontSize $ em 1.6
            paddingTop $ px 10
            -- textAlign center
            textAlign justify
            textIndent $ indent $ px 20
            lineHeight $ em 1.2

    ".card3" ? do 
        width $ px 600
        -- height $ px 160

        borderColor navbarColor
        borderWidth $ px 4
        borderStyle solid

        sym2 margin (px 5) nil

        display flex
        flexDirection row
        justifyContent spaceBetween
        alignItems center


        sym padding $ px 10

        figure ? do
            -- borderColor green
            -- borderWidth $ px 0.1
            -- borderStyle solid

            Flexbox.flex 1 0 auto
            textAlign center

            -- width $ pct 25

            img ? do
                height $ px 120

        "div" ? do
            Flexbox.flex 3 1 auto

        h1 ? do
            fontSize $ em 1.6
            fontWeight bold
            paddingTop $ px 15
            textAlign center

        p ? do
            fontSize $ em 1.6
            sym padding $ px 20
            -- textAlign center
            lineHeight $ em 1.2

    ".card-profit" ? do 
        width $ px 600
        -- height $ px 160

        borderColor navbarColor
        borderWidth $ px 4
        borderStyle solid

        sym2 margin (px 5) nil
        sym padding $ px 30


        h1 ? do
            fontSize $ em 1.6
            fontWeight bold
            paddingTop $ px 0
            paddingBottom $ px 15
            textAlign start

        ul ? do
            fontSize $ em 1.6
            -- sym padding $ px 20
            -- textAlign center
            lineHeight $ em 1.5

            li ? do
                sym2 padding (px 10) nil

            li # ":before" ? do
                content $ stringContent "✔ "
                -- position absolute
                top $ px 0
                left $ px 0
                color navbarColor
                fontSize $ em 1.8
                


    ".package-card" ? do 
        width $ px 280
        height $ px 680
        position relative

        alignItems center

        borderColor navbarColor
        borderWidth $ px 4
        borderStyle solid

        h1 ? do
            backgroundColor navbarColor
            color white

            sym2 padding (px 30) (px 20)

            fontSize $ rem 1

        ul ? do
            sym2 padding nil $ px 20

            -- listStyleImage $ imageUrl "../img/shevron.jpg"

            li ? do
                display block
                fontSize $ rem 1
                lineHeight $ em 1.5
                borderBottomStyle solid
                borderBottomColor gray
                borderBottomWidth $ px 0.1

                paddingTop $ em 1
                paddingBottom $ em 1

            li # lastChild ? do
                borderBottomWidth nil 

        ".callback-simple"  ? do
            -- borderStyle solid
            -- borderColor blue
            -- borderWidth $ px 0.1 

            position absolute
            bottom $ px 20
            left $ px 0

            width $ pct 100

            a ? do
                display block           
                marginLeft (px 40)
                marginRight (px 40)
                paddingTop (rem 1)
                paddingBottom (rem 1)

                backgroundColor navbarColor
                color white

                textAlign center
                fontSize $ rem 1
                textDecoration none


        -- p # ":first-of-type" ? do
        --     debugBorder green
        --     paddingTop $ px 15

        -- p ? do
        --     fontSize $ em 1.6
        --     paddingTop $ px 10
        --     -- textAlign center
        --     textAlign justify
        --     textIndent $ indent $ px 20
        --     lineHeight $ em 1.2

            


    ".service-item" ? do
        display flex
        justifyContent spaceAround
        height $ pct 100

    "#callback-popup" ? do
        fieldset ? do
            display grid
            "grid-template-columns" -: "auto auto"
            -- "grid-template-rows" -: "2rem"
            "grid-row-gap" -: "15px"


    ".ui-dialog" ? do
        sym padding nil
        fontSize $ rem 1
    
    ".ui-widget-header" ? do
        background navbarColor
        color white

    


            

