{-# LANGUAGE OverloadedStrings #-}

module TestPage
    ( testPageStylesheet
    ) where

import Clay
import qualified Clay.Flexbox as Flexbox (flex, wrap)
import qualified Clay.Media as Media
import Prelude hiding (rem, (**))

import Common

testPageStylesheet :: Css
testPageStylesheet = do

    query Media.screen [Media.minWidth $ px 900] $ do
        "#test" ? do
            display block
            paddingBottom nil

            ".callback-button" ? do
                display none

        "#test-content" ? do
            display flex

    query Media.screen [Media.maxWidth $ px 900] $ do
        "#test" ? do
            display flex
            alignItems center

            ".callback-button" ? do
                display block
                sym2 margin (px 20) nil

        "#test-content" ? do
            display none

    "#test" ? do
        position relative
        width $ vw 100

        backgroundImages [hGradient (rgba 0 0 0 0.5) (rgba 0 0 0 0.5), url "../img/map_omsk.png"]
        backgroundSize $ by (pct 100) (pct 100)

        fontSize $ rem 1.3

        query Media.screen [Media.maxWidth $ px 1420] $ do
            fontSize $ rem 1

        query Media.screen [Media.maxWidth $ px 1080] $ do
            fontSize $ rem 0.8

        header <? do
            h1 ? do
                color white
                lineHeight $ em 1.2
            h2 ? do
                paddingBottom nil
                paddingLeft $ px 10
                paddingRight $ px 10

                color white
                lineHeight $ em 1.2

    "#test-desc" ? do
        display flex
        alignItems center
        padding nil nil nil (pct 10) 
        width $ pct 50

        fontSize $ em 3.5
        lineHeight $ em 1.2
        color white


    "#test-form" ? do
        -- sym margin auto
        -- flexGrow 1
        -- flexShrink 1
        -- borderStyle solid
        -- borderWidth $ px 0.1
        -- borderColor red

        marginTop $ px 20

    "#test-div" ? do
        testDivSizing 1 (pct 10) (em 1.6)

        query Media.screen [Media.maxWidth $ px 1420] $ do
            testDivSizing 0.8 (px 5) (em 1.6)

        backgroundImage $ url "../img/smartphone_in_hand_3.png"
        backgroundSize $ by (pct 100) (pct 100)

        "p" ? do
            position relative

testDivSizing scale rightPos fontS = do
    let 
        outerHeight = px 636
        outerWidth = outerHeight @* (540 / 636)

        innerHeight = outerHeight @* (528 / 636)
        innerWidth = innerHeight @* (257 / 528)

        innerLeft = outerWidth @* (105 / 540)
        innerTop =  outerHeight @* (37 / 636)

    right rightPos
    bottom nil

    width $ (outerWidth @* scale)
    height $ (outerHeight @* scale)

    fontSize fontS

    "p" ? do
        position relative
        left $ (innerLeft @* scale)
        top $ (innerTop @* scale) 

        height $ (innerHeight @* scale)
        width $ (innerWidth @* scale)

        sym padding $ px 5