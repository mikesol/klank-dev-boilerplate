{-
Welcome to your new Dhall package-set!

Below are instructions for how to edit this file for most use
cases, so that you don't need to know Dhall to use it.

## Warning: Don't Move This Top-Level Comment!

Due to how `dhall format` currently works, this comment's
instructions cannot appear near corresponding sections below
because `dhall format` will delete the comment. However,
it will not delete a top-level comment like this one.

## Use Cases

Most will want to do one or both of these options:
1. Override/Patch a package's dependency
2. Add a package not already in the default package set

This file will continue to work whether you use one or both options.
Instructions for each option are explained below.

### Overriding/Patching a package

Purpose:
- Change a package's dependency to a newer/older release than the
    default package set's release
- Use your own modified version of some dependency that may
    include new API, changed API, removed API by
    using your custom git repo of the library rather than
    the package set's repo

Syntax:
Replace the overrides' "{=}" (an empty record) with the following idea
The "//" or "⫽" means "merge these two records and
  when they have the same value, use the one on the right:"
-------------------------------
let overrides =
  { packageName =
      upstream.packageName // { updateEntity1 = "new value", updateEntity2 = "new value" }
  , packageName =
      upstream.packageName // { version = "v4.0.0" }
  , packageName =
      upstream.packageName // { repo = "https://www.example.com/path/to/new/repo.git" }
  }
-------------------------------

Example:
-------------------------------
let overrides =
  { halogen =
      upstream.halogen // { version = "master" }
  , halogen-vdom =
      upstream.halogen-vdom // { version = "v4.0.0" }
  }
-------------------------------

### Additions

Purpose:
- Add packages that aren't already included in the default package set

Syntax:
Replace the additions' "{=}" (an empty record) with the following idea:
-------------------------------
let additions =
  { package-name =
       { dependencies =
           [ "dependency1"
           , "dependency2"
           ]
       , repo =
           "https://example.com/path/to/git/repo.git"
       , version =
           "tag ('v4.0.0') or branch ('master')"
       }
  , package-name =
       { dependencies =
           [ "dependency1"
           , "dependency2"
           ]
       , repo =
           "https://example.com/path/to/git/repo.git"
       , version =
           "tag ('v4.0.0') or branch ('master')"
       }
  , etc.
  }
-------------------------------

Example:
-------------------------------
let additions =
  { benchotron =
      { dependencies =
          [ "arrays"
          , "exists"
          , "profunctor"
          , "strings"
          , "quickcheck"
          , "lcg"
          , "transformers"
          , "foldable-traversable"
          , "exceptions"
          , "node-fs"
          , "node-buffer"
          , "node-readline"
          , "datetime"
          , "now"
          ]
      , repo =
          "https://github.com/hdgarrood/purescript-benchotron.git"
      , version =
          "v7.0.0"
      }
  }
-------------------------------
-}


let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.13.8-20200911-2/packages.dhall sha256:872c06349ed9c8210be43982dc6466c2ca7c5c441129826bcb9bf3672938f16e

let overrides = {=}

let additions = {
    audio-behaviors =
      { dependencies =
          [ "aff-promise"
            , "behaviors"
            , "console"
            , "debug"
            , "effect"
            , "drawing"
            , "canvas"
            , "foreign-object"
            , "heterogeneous"
            , "parseint"
            , "psci-support"
            , "record-extra"
            , "sized-vectors"
            , "typelevel-prelude"
            , "typelevel-graph"
          ]
      , repo =
          "https://github.com/mikesol/purescript-audio-behaviors.git"
      , version =
          "master"
      },
    typelevel-graph =
      { dependencies =
          [ 
             "record-extra"
            , "typelevel-peano"
          ]
      , repo =
          "https://github.com/mikesol/purescript-typelevel-graph.git"
      , version =
          "main"
      },
    typelevel-klank-dev =
      { dependencies =
          [ "audio-behaviors"
          ]
      , repo =
          "https://github.com/mikesol/type.klank.dev.git"
      , version =
          "main"
      },
    klank-dev-util =
      { dependencies =
          [ "audio-behaviors"
          ]
      , repo =
          "https://github.com/mikesol/util.klank.dev.git"
      , version =
          "main"
      }

      
}

in  upstream // overrides // additions
