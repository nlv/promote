{-# LANGUAGE OverloadedStrings #-}

module Footer
    ( footerStylesheet
    ) where

import Clay
import qualified Clay.Flexbox as Flexbox (flex, wrap)
import qualified Clay.Media as Media
import Prelude hiding (rem, (**))

import Common


footerStylesheet :: Css
footerStylesheet = do

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






    


            

