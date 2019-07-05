{-# LANGUAGE OverloadedStrings #-}

module CallbackPopup
    ( callbackPopupStylesheet
    ) where

import Clay
-- import qualified Clay.Flexbox as Flexbox (flex, wrap)
-- import qualified Clay.Media as Media
import Prelude hiding (rem)

import Common


callbackPopupStylesheet :: Css
callbackPopupStylesheet = do

    "#callback-popup" ? do
        fontSize $ rem 1.6

        fieldset ? do
            display grid
            "grid-template-columns" -: "auto auto"
            -- "grid-template-rows" -: "2rem"
            "grid-row-gap" -: "15px"


    ".ui-dialog" ? do
        sym padding nil
    
        ".ui-widget-header" ? do
            fontSize $ rem 1.6
            background brandColor
            color white

        ".ui-dialog-buttonset" ? do
            fontSize $ rem 1.6
