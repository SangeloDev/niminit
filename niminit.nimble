# Package

version       = "0.1.0"
author        = "Sangelo"
description   = "A Nim initialising script, because that definitely does not exist already."
license       = "GPL-3.0-only"
srcDir        = "src"
bin           = @["niminit"]


# Dependencies

requires "nim >= 1.6.10"
requires "parsetoml == 0.7.0"