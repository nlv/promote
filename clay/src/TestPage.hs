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

    "#test" ? do
        -- borderStyle solid
        -- borderWidth $ px 0.1
        -- borderColor green

        display block
        width $ vw 100
        -- height $ vh 100
        height $ px 636 @+@ (navbarHeight @+@ (px 5)) @* 2
        paddingBottom (navbarHeight @+@ (px 5))

        position relative

        backgroundImage $ url "../img/map_omsk.png"
        backgroundSize $ by (pct 100) (pct 100)

        header <? do
            marginBottom $ px 20

    "#test-div" ? do
        position absolute
        testDivSizing 1 (pct 10) (rem 2)

        backgroundImage $ url "../img/smartphone_in_hand_3.png"
        backgroundSize $ by (pct 100) (pct 100)

        "p" ? do
            position relative

            borderStyle solid
            borderWidth $ px 0.1
            borderColor green

        query Media.screen [Media.maxWidth $ px 1280] $ do
            testDivSizing 0.8 (px 5) (rem 2)

        query Media.screen [Media.maxWidth $ px 900] $ do
            testDivSizing 0.6 (px 5) (rem 1.6)

            
-- testDivSizing :: Double -> Css 
testDivSizing scale rightPos fontS = do
    let 
        outerHeight = px 636
        outerWidth = px 540

        -- outerHeight = pct 100
        -- outerWidth = outerHeight @* (540 / 636)

        innerHeight = outerHeight @* (528 / 636)
        -- innerHeight = px 528
        -- innerHeight = pct 100
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