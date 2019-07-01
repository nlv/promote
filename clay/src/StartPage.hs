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

    let h1pb = px 25
        h2pb = h1pb @+@ px 5

    "#start-page" ? do
        height $ vh 100

        display flex
        flexDirection column
        justifyContent center
        alignItems center

        background $ rgba 0 0 0 0.2

        query Media.screen [Media.maxWidth $ px 1280] $ do
            fontSize $ rem 0.8

        query Media.screen [Media.maxWidth $ px 900] $ do
            fontSize $ rem 0.7

        query Media.screen [Media.maxWidth $ px 780] $ do
            fontSize $ rem 0.6

        header ? do
            sym2 padding nil (px 40)

            query Media.screen [Media.maxWidth $ px 640] $ do
                sym2 padding nil (px 10)

            h1 ? do
                textAlign center
                fontSize $ em 4
                fontWeight $ weight 600
                paddingBottom h1pb

                color $ lightgray

            h2 ? do
                textAlign center
                fontSize $ em 2.5
                fontWeight $ weight 600
                paddingBottom h2pb

                color brandColor

        "video" ? do
            position absolute
            left nil
            top nil
            width $ pct 100
            minHeight $ pct 100
            zIndex (-1)
            "object-fit" -: "cover"

    ".callback-button" ? do
        width $ vw 90
        maxWidth $ px 540
        sym padding (px 15)

        backgroundColor $ rgb 255 102 0
        sym borderRadius $ px 20

        textAlign center
        fontSize $ em 1.5

        query Media.screen [Media.maxWidth $ px 900] $ do
            maxWidth $ px 400
            fontSize $ em 1.8

        ":hover" & do
            backgroundColor $ rgb 265 117 0 

        "a" ? do
            color white
            textTransform uppercase
            textDecoration none