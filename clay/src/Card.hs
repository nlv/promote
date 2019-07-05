{-# LANGUAGE OverloadedStrings #-}

module Card
    ( cardStylesheet
    ) where

import Clay
import qualified Clay.Flexbox as Flexbox (flex, wrap)
import qualified Clay.Media as Media
import Prelude hiding (rem, (**))

import Common

cardStylesheet :: Css
cardStylesheet = do
    let cardsNarrowGrid = do
            query Media.screen [Media.maxWidth $ px 1280] $ do
                "grid-template-columns" -: "auto auto"

            query Media.screen [Media.maxWidth $ px 700] $ do
                "grid-template-columns" -: "auto"


    ".cards" ? do
        display grid
        justifyContent center
        "grid-column-gap" -: "20px"
        "grid-row-gap" -: "20px"

    ".card" ? do 
        display flex
        flexDirection column
        alignItems center

        width $ px 280
        sym padding $ px 10

        borderColor brandColor
        borderWidth $ px 4
        borderStyle solid

        fontSize $ rem 1.6

        query Media.screen [Media.maxWidth $ px 1280] $ do
            fontSize $ rem 1.4

        hgroup ? do
            figure ? do
                textAlign center
                img ? do
                    width $ pct 70

            h1 ? do
                paddingTop $ px 15
                lineHeight $ em 1.2
                fontWeight bold

        p # ":first-of-type" ? do
            paddingTop $ px 15

        p ? do
            paddingTop $ px 10
            textAlign justify
            lineHeight $ em 1.2

    ".package-card" ? do 
        width $ px 280
        height $ px 580
        position relative

        alignItems center

        borderColor brandColor
        borderWidth $ px 4
        borderStyle solid

        fontSize $ rem 1.4

        h1 ? do
            sym2 padding (px 30) (px 20)

            backgroundColor brandColor
            color white

        ul ? do
            sym2 padding nil $ px 20

            li ? do
                display block
                lineHeight $ em 1.2
                borderBottomStyle solid
                borderBottomColor gray
                borderBottomWidth $ px 0.1

                paddingTop $ em 1
                paddingBottom $ em 1

            li # lastChild ? do
                borderBottomWidth nil 

        ".callback-simple"  ? do
            position absolute
            bottom $ px 20
            left $ px 0

            width $ pct 100

            a ? do
                display block           
                marginLeft (px 40)
                marginRight (px 40)
                paddingTop (rem 1)
                paddingBottom (rem 1)

                backgroundColor brandColor
                color white

                textAlign center
                textDecoration none

    ".service-item" ? do
        display flex
        justifyContent spaceAround
        height $ pct 100

    ".card-profit" ? do 
        width $ px 470

        borderColor brandColor
        borderWidth $ px 4
        borderStyle solid

        sym2 margin (px 5) nil
        sym padding $ px 30

        fontSize $ rem 1.6

        query Media.screen [Media.maxWidth $ px 1280] $ do
            fontSize $ rem 1.4
            width auto
            marginLeft $ px 20
            marginRight $ px 20

        h1 ? do
            fontWeight bold
            paddingTop $ px 0
            paddingBottom $ px 15
            textAlign start

            lineHeight $ em 1.2

        ul ? do
            lineHeight $ em 1.2

            li ? do
                sym2 padding (px 10) nil

            li # ":before" ? do
                content $ stringContent "✔ "
                top $ px 0
                left $ px 0
                color brandColor

    {-
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

                



    -}