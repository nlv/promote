{-# LANGUAGE OverloadedStrings #-}

module Stylesheets
    ( mainStylesheet
    ) where

import Clay
import qualified Clay.Flexbox as Flexbox (flex, wrap)
import qualified Clay.Media as Media
import Prelude hiding (rem, (**))

import Common
import Navbar
import StartPage
import Page
import Card
import CallbackPage
import CallbackPopup

navbarHPadding = pct 10

mainStylesheet :: Bool -> Css
mainStylesheet debug = do

    importUrl "../fonts/raleway/raleway.css"

    html ? do
        fontSize rootFontSize 
        fontFamily [rootFontName] [secondaryFontName]

    ".brand-phone" ? do
        fontFamily ["sans-serif"] [secondaryFontName]

    navbarStylesheet "#navbar"
    startPageStylesheet
    pageStylesheet
    cardStylesheet
    callbackPageStylesheet
    callback2PageStylesheet
    callbackPopupStylesheet




    {-

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
                

    ".service-item" ? do
        display flex
        justifyContent spaceAround
        height $ pct 100

    -}

    


            

