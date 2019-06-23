{-# LANGUAGE OverloadedStrings #-}

module StartPage
    ( startPageStylesheet
    ) where

import Clay
import qualified Clay.Flexbox as Flexbox (flex, wrap)
import qualified Clay.Media as Media
import Prelude hiding (rem, (**))

import Common

startPageStylesheet :: Css
startPageStylesheet = do

    "#start-page" ? do
        height $ vh 100

        background $ rgba 0 0 0 0.2

        display flex
        justifyContent center
        alignItems center

        header ? do

            sym2 padding nil (px 40)

            h1 ? do
                textAlign center
                fontSize $ em 4
                fontWeight $ weight 600
                paddingBottom $ px 10

                color $ lightgray

            h2 ? do
                textAlign center
                fontSize $ em 2.6
                fontWeight $ weight 600
                -- paddingBottom $ px 14

                color brandColor

                p ? do
                    marginLeft auto
                    marginRight auto
                    textAlign center

                    width $ pct 100

                    fontSize $ em 2.5

                    display inlineBlock

        "video" ? do
            position absolute
            left nil
            top nil
            width $ pct 100
            minHeight $ pct 100
            zIndex (-1)
            "object-fit" -: "cover"

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

        query Media.screen [Media.maxWidth $ px 1280] $ do
            fontSize $ rem 0.8

        query Media.screen [Media.maxWidth $ px 900] $ do
            fontSize $ rem 0.7

        query Media.screen [Media.maxWidth $ px 780] $ do
            fontSize $ rem 0.6


        -- query Media.screen [Media.maxWidth $ px 530] $ do
            -- sym2 padding nil (px 35)

    -- query Media.screen [Media.maxWidth $ px 900] $ do
    --     "#start-page" ? do
    --         -- display block

    --         header ? do
    --             display flex
    --             flexDirection column
    --             height $ pct 100
    --             textAlign center

    --             -- backgroundColor $ rgba 0 0 0 0.4


    --             marginTop nil
    --             paddingTop (navbarHeight @+@ (px 60))

    --             h1 ? do
    --                 fontSize $ em 2.4
    --                 color $ lightgoldenrodyellow
    --                 color $ lightgray

    --             p ? do
    --                 marginLeft auto
    --                 marginRight auto
    --                 textAlign center

    --                 width $ pct 100

    --                 fontSize $ em 2.5



    


            

