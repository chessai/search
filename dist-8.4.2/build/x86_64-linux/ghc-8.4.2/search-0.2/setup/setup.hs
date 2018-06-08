#!/usr/bin/runhaskell

{-# OPTIONS_GHC -Wall #-}
import Distribution.Extra.Doctest ( defaultMainWithDoctests )
main :: IO ()
main = defaultMainWithDoctests "doctests"


