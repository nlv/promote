{-# LANGUAGE OverloadedStrings #-}

module Page
    ( pageStylesheet
    ) where

import Clay
import qualified Clay.Flexbox as Flexbox (flex, wrap)
import qualified Clay.Media as Media
import Prelude hiding (rem, (**))

import Common

pageStylesheet :: Css
pageStylesheet = do
    let cardsNarrowGrid = do
            query Media.screen [Media.maxWidth $ px 1280] $ do
                "grid-template-columns" -: "auto auto"

            query Media.screen [Media.maxWidth $ px 700] $ do
                "grid-template-columns" -: "auto"


    ".page" ? do
        display flex
        flexDirection column
        alignItems center

        paddingTop (navbarHeight @+@ (px 5))
        paddingBottom (navbarHeight @+@ (px 5))

        query Media.screen [Media.maxWidth $ px 1280] $ do
            fontSize $ rem 0.8

        query Media.screen [Media.maxWidth $ px 900] $ do
            fontSize $ rem 0.7

            ".newline-mobile" ? do
                display block

        query Media.screen [Media.maxWidth $ px 780] $ do
            fontSize $ rem 0.6

        h1 ? do
            textTransform uppercase
            textAlign center

        h2 ? do 
            textTransform uppercase
            textAlign center

        header <? do
            h1 ? do
                sym2 padding inherit (px 15)
                paddingTop $ px 15

                fontSize $ em 3
                lineHeight $ unitless 1.2

            h2 ? do
                paddingTop $ px 10
                paddingBottom $ px 20

                fontSize $ em 2.4
                color $ rgba 0 0 0 0.5

    "#sec-target" ? do
        backgroundColor $ rgb 237 242 247

        ".cards" ? do
            "grid-template-columns" -: "auto auto auto auto"
            cardsNarrowGrid

    "#warranty" ? do
        ".cards" ? do
            "grid-template-columns" -: "auto auto auto"
            cardsNarrowGrid

    "#workflow" ? do
        ".cards" ? do
            "grid-template-columns" -: "auto auto auto"
            cardsNarrowGrid

    "#services" ? do
        backgroundColor $ rgb 237 242 247
        ".cards" ? do
            "grid-template-columns" -: "auto auto auto"
            cardsNarrowGrid

        header ? do
            h2 ? do
                color brandColor
                fontSize $ em 2

    "#profit" ? do
        ".cards" ? do
            "grid-template-columns" -: "auto auto"

            query Media.screen [Media.maxWidth $ px 1280] $ do
                "grid-template-columns" -: "auto"



    {-

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




    -}