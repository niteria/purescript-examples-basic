{ name = "halogen-example-basic"
, license = "Apache-2.0"
, repository = "https://github.com/purescript-halogen/purescript-halogen"
, dependencies =
    [ "effect"
    , "prelude"
    , "halogen"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
