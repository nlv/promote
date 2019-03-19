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
navbarColor = rgb 251 166 40

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

        backgroundSize cover
        backgroundImage $ url "../img/start_page_cover.jpg"
        backgroundAttachment attachFixed

        display flex
        justifyContent center
        alignItems center

        paddingTop nil


        header ? do

            marginTop $ pct (-20)

            h1 ? do
                -- debugBorder gray

                textAlign center
                fontSize $ em 3.1
                paddingBottom $ px 10

                color $ lightgoldenrodyellow
                color $ lightgray

            h2 ? do
                -- debugBorder blue

                display flex

                paddingBottom $ px 10

                color $ setA 0.7 navbarColor

            h2 ** ul ? do
                -- debugBorder green

                marginLeft auto
                marginRight auto

                display flex
                width $ pct 100
                justifyContent center

                fontSize $ em 1.8

                li ? do
                    paddingLeft $ px 15
                    paddingRight $ px 15

                    display inlineBlock

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

        backgroundColor $ rgba 0 0 0 0.8

        fontSize $ em 1.1
        textTransform uppercase

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
        fontSize $ rem 1.2

    ".navbar-toggle" ? do
        display none
        borderStyle none
        color navbarColor
        backgroundColor transparent
        fontSize $ rem 1.8
        cursor pointer

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

                backgroundColor $ rgba 0 0 0 0.4


                marginTop nil
                paddingTop (navbarHeight @+@ (px 60))

                h1 ? do
                    fontSize $ em 2.4
                    color $ lightgoldenrodyellow
                    color $ lightgray


                h2 ** ul ? do
                    -- debugBorder green

                    marginLeft auto
                    marginRight auto

                    display flex
                    flexDirection column
                    width $ pct 100

                    li ? do

                        display inlineBlock
                        textAlign center
                        sym2 padding (px 20) nil 

        ".page" ? do

            h1 ? do

                fontSize $ rem 1.2
                textTransform uppercase

            h2 ? do

                fontSize $ rem 1

        ".cards" ? do
            display grid
            "grid-template-columns" -: "auto auto"
            "grid-template-rows" -: "auto auto"
            -- flexWrap Flexbox.wrap
            -- justifyContent spaceAround

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
            maxWidth $ px 1200
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

            

