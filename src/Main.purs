module Main where

import Prelude
import Data.List ((:), List(..))
import Data.NonEmpty ((:|))
import Data.Typelevel.Num (D1)
import Effect (Effect)
import Effect.Class.Console (log)
import FRP.Behavior (Behavior)
import FRP.Behavior.Audio (AudioUnit, gain', sinOsc, speaker)
import Math (pi, sin)

scene :: Number -> Behavior (AudioUnit D1)
scene time =
  let
    rad = pi * time
  in
    pure
      $ speaker
          ( (gain' 0.1 $ sinOsc (440.0 + (10.0 * sin (2.3 * rad))))
              :| (gain' 0.25 $ sinOsc (235.0 + (10.0 * sin (1.7 * rad))))
              : (gain' 0.2 $ sinOsc (337.0 + (10.0 * sin rad)))
              : (gain' 0.1 $ sinOsc (530.0 + (19.0 * (5.0 * sin rad))))
              : Nil
          )

main :: Effect Unit
main = do
  log "🍝"