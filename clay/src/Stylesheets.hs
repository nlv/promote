{-# LANGUAGE OverloadedStrings #-}

module Stylesheets
    ( mainStylesheet
    ) where

import Clay

fontName = "Raleway"
secondaryFontName = serif

-- FIXME: дожна коррелировать с высотой навигационной панели 
navbarHeight = (px 105)

mainStylesheet :: Bool -> Css
mainStylesheet debug = do
    importUrl "../fonts/Raleway-Regular.ttf"
    importUrl "../fonts/Raleway-Regular-Italic.ttf"
    importUrl "../fonts/Raleway-Bold.ttf"
    importUrl "../fonts/Raleway-Bold-Italic.ttf"

    -- Для корректной прокрутки разделов (из доки bootstrap scroll-spy) 
    body ? do
        position relative 
        fontFamily [fontName] [secondaryFontName]

    "#navbar" ? do 
        if debug then border solid (px 1) blue else border inherit inherit inherit

    -- "#navbar" ? do 
    --     /* FIXME: или через container-fluid */
    --     /* margin-right: 0; */
    -- }

    "#start-page" ? do
        backgroundSize cover
        backgroundImage $ url "../img/start_page_cover.jpg"

    -- /* FIXME: убирать на малых экранах как navbar-toggler */
    -- #start-phone {
    --     /* margin-right: 50px; */
    -- }

    ".page" ? do
        height $ vh 100
        width $ vw 100

        paddingTop navbarHeight