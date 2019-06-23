{-# LANGUAGE OverloadedStrings #-}

module Common
    ( rootFontSize
    , rootFontName
    , secondaryFontName
    , brandColor
    ,navbarHeight
    ) where

import Clay
import Data.Text

rootFontSize = px 12
rootFontName = "Raleway" :: Text
secondaryFontName = sansSerif
brandColor = rgb 255 102 0

navbarHeight = px 95
