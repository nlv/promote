{-# LANGUAGE OverloadedStrings #-}

module Stylesheets
    ( mainStylesheet
    ) where

import Clay
import Prelude hiding (rem, (**))

rootFontSize = px 12
rootFontName = "Raleway"
-- fontName = "Amatic SC"

secondaryFontName = sansSerif

navbarHeight = px 95
navbarHPadding = pct 10
navbarColor = rgb 251 166 40

-- FIXME: дожна коррелировать с высотой навигационной панели 
-- navbarHeight = (px 105)

mainStylesheet :: Bool -> Css
mainStylesheet debug = do
    let debugBorder = if debug then border solid (px 1) blue else border inherit inherit inherit
    importUrl "../fonts/raleway/raleway.css"

    -- Для корректной прокрутки разделов (из доки bootstrap scroll-spy) 
    body ? do
        fontSize rootFontSize 
        fontFamily [rootFontName] [secondaryFontName]

    "#start-page" ? do
        debugBorder
        backgroundSize cover
        backgroundImage $ url "../img/start_page_cover.jpg"
        backgroundAttachment attachFixed

        -- backgroundColor black
        -- opacity 0.995

        paddingTop nil

        display flex
        justifyContent center
        alignItems center

        header ? do
            width (pct 55)

            marginTop $ pct (-20)

            -- backgroundColor black
            -- opacity 0.6

            h1 ? do
                debugBorder

                textAlign center
                -- lineHeight (em 2)
                fontSize $ em 3
                -- fontWeight $ weight 600
                paddingBottom $ px 10

                color $ setA 1.0 navbarColor

            h2 ? do
                debugBorder

                display flex

                color $ setA 0.7 navbarColor


            h2 ** ul ? do
                debugBorder

                marginLeft auto
                marginRight auto

                display flex
                width $ pct 100
                justifyContent center

                fontSize $ em 1.8

                li ? do
                    paddingLeft $ px 20
                    paddingRight $ px 20

                    display inlineBlock

                    -- color lightgray



    "#navbar" ? do 
        debugBorder

        display flex
        alignItems center
        justifyContent spaceBetween

        minHeight navbarHeight
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

        ul ? do
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

    "#navbar-phone" ? do
        fontSize $ rem 1.2


    ".navbar-toggler" ? do
        display none


    ".page" ? do
        height $ vh 100

        paddingTop (navbarHeight @+@ (px 5))