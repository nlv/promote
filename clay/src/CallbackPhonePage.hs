{-# LANGUAGE OverloadedStrings #-}

module CallbackPhonePage
    ( callbackPhonePageStylesheet
    ) where

import Clay
import qualified Clay.Flexbox as Flexbox (flex, wrap)
import qualified Clay.Media as Media
import Prelude hiding (rem, (**))

import Common

callbackPhonePageStylesheet :: Css
callbackPhonePageStylesheet = do

    query Media.screen [Media.minWidth $ px 900] $ do
        "#callback-phone" ? do
            display block
            paddingBottom nil

            ".callback-button" ? do
                display none

        "#callback-phone-content" ? do
            display flex

    query Media.screen [Media.maxWidth $ px 900] $ do
        "#callback-phone" ? do
            display flex
            alignItems center

            ".callback-button" ? do
                display block
                sym2 margin (px 20) nil

        "#callback-phone-content" ? do
            display none

    "#callback-phone" ? do
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

    "#callback-phone-desc" ? do
        display flex
        alignItems center
        padding nil nil nil (pct 10) 
        width $ pct 50

        fontSize $ em 3.5
        lineHeight $ em 1.2
        color white

    "#callback-phone-phone" ? do
        sizing 1 (pct 10) (em 1.6)

        query Media.screen [Media.maxWidth $ px 1420] $ do
            sizing 0.8 (px 5) (em 1.6)

        backgroundImage $ url "../img/smartphone_in_hand.png"
        backgroundSize $ by (pct 100) (pct 100)

        form ? do
            fieldset ? do
                display flex
                flexDirection column
                justifyContent center

                height $ pct 100

                input ? do
                    width $ (pct 100 @-@ (px 30))
                    sym2 padding (px 5) (px 15)
                    sym2 margin (px 20) nil

                    borderWidth nil
                    sym borderRadius $ px 20

                    lineHeight $ unitless 2

                    "type=submit" & do
                        width $ pct 100
                        backgroundColor brandColor
                        color white
                        fontSize $ rem 1.6

sizing scale rightPos fontS = do
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

    form ? do
        position relative
        left $ (innerLeft @* scale)
        top $ (innerTop @* scale) 

        height $ (innerHeight @* scale)

        sym padding $ px 15

        fieldset ? do
            width $ (innerWidth @* scale) @-@ (px 10) @-@ (px 18)