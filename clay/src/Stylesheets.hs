{-# LANGUAGE OverloadedStrings #-}

module Stylesheets
    ( mainStylesheet
    ) where

import Clay
import qualified Clay.Flexbox as Flexbox (flex)
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

    ".page" ? do
        height $ vh 100

    "#p1" ? debugBack red
    "#p2" ? debugBack green
    "#p3" ? debugBack blue
    "#p4" ? debugBack yellow

    "#start-page" ? do
        debugBorder blue 

        backgroundSize cover
        backgroundImage $ url "../img/start_page_cover.jpg"
        backgroundAttachment attachFixed

        display flex
        justifyContent center
        alignItems center

    --     paddingTop nil


    --     header ? do
    --         width (pct 55)

    --         -- marginTop $ pct (-20)

    --         h1 ? do
    --             debugBorder

    --             textAlign center
    --             fontSize $ em 3.1
    --             paddingBottom $ px 10

    --             color $ lightgoldenrodyellow
    --             color $ lightgray

    --         h2 ? do
    --             debugBorder

    --             display flex

    --             paddingBottom $ px 10

    --             color $ setA 0.7 navbarColor



    --         h2 ** ul ? do
    --             debugBorder

    --             marginLeft auto
    --             marginRight auto

    --             display flex
    --             width $ pct 100
    --             justifyContent center

    --             fontSize $ em 1.8

    --             li ? do
    --                 paddingLeft $ px 15
    --                 paddingRight $ px 15

    --                 display inlineBlock

    --                 -- color lightgray



    "#navbar" ? do 
        debugBorder green

        display flex
        alignItems center
        justifyContent spaceBetween


        -- minHeight navbarHeight
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

    query Media.screen [Media.maxWidth $ px 1280] $ do
        "#navbar" ? do
            paddingLeft $ px 10
            paddingRight $ px 10

        ".brand" ? do
            transform $ scale 0.7 0.7

    query Media.screen [Media.maxWidth $ px 835] $ do
        ".navbar-nav" ? do
            width (pct 80)

        ".navbar-phone" ? do
            display none

    -- query Media.screen [Media.maxWidth $ px 768] $ do
    --     ".navbar-nav" ? do
    --         width (pct 80)

    --     ".navbar-phone" ? do
    --         display none

    query Media.screen [Media.maxWidth $ px 480] $ do

        "#navbar" ? do
            -- paddingLeft $ px 5
            -- paddingRight $ px 5

            ".navbar-nav" ? do
                display none

            -- ".navbar-phone" ? do
            --     display none

            ".navbar-toggle" ? do
                display inlineBlock



    -- ".page" ? do
    --     display flex
    --     flexDirection column

    --     width $ pct 70
    --     height $ vh 100
    --     marginLeft auto
    --     marginRight auto
    --     paddingTop (navbarHeight @+@ (px 5))

    --     -- justifyContent center

    --     hgroup ? do
    --         -- debugBorder

    --         paddingTop $ px 20
    --         paddingBottom $ px 20


    --     h1 ? do
    --         -- debugBorder

    --         sym padding $ px 15

    --         fontSize $ rem 2.2
    --         -- fontWeight $ weight 600
    --         textTransform uppercase


    --         textAlign center

    --     h2 ? do
    --         -- debugBorder

    --         sym padding $ px 15

    --         fontSize $ rem 1.6
    --         textTransform uppercase

    --         color $ rgba 0 0 0 0.5

    --         textAlign center

    -- ".cards" ? do
    --     display flex
    --     justifyContent spaceBetween

    --     paddingTop $ px 5
    --     paddingBottom $ px 15

    -- ".card" ? do 
    --     width $ px 280
    --     height $ px 400

    --     display flex
    --     flexDirection column
    --     alignItems center

    --     borderColor navbarColor
    --     borderWidth $ px 4
    --     borderStyle solid

    --     sym padding $ px 10

    --     hgroup ? do

    --         -- FIXME пересекается с правилом выше надо делать a > b
    --         paddingTop $ px 0
    --         paddingBottom $ px 0

    --         figure ? do
    --             textAlign center
    --             img ? do
    --                 width $ pct 70

    --         h1 ? do
    --             debugBorder
    --             fontSize $ em 1.9
    --             paddingTop $ px 5
    --             textAlign center

    --     p ? do
    --         debugBorder
    --         fontSize $ em 1.6
    --         paddingTop $ px 5
    --         paddingBottom $ px 5
    --         textAlign center

