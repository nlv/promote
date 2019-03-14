{-# LANGUAGE OverloadedStrings #-}

module Stylesheets
    ( mainStylesheet
    ) where

import Clay
import Prelude hiding (rem)

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
    importUrl "../fonts/raleway/raleway.css"

    -- Для корректной прокрутки разделов (из доки bootstrap scroll-spy) 
    body ? do
        fontSize rootFontSize 
        fontFamily [rootFontName] [secondaryFontName]

    "#start-page" ? do
        backgroundSize cover
        backgroundImage $ url "../img/start_page_cover.jpg"

        paddingTop nil

        display flex
        justifyContent center
        alignItems center

        header ? do
            fontSize $ em 4
            color white

    "#navbar" ? do 
        if debug then border solid (px 1) blue else border inherit inherit inherit

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