# creo_config
Configuration file for Creo Parametric 5.0

Creo uses config.pro and config.sup to drive user settings. This file is config.pro and config.sup all in one.
Config.sup is the admin file setup that users cannot (should not?) change. System wide environments, units, directories.
Config.pro is the local user settings applied in addition to config.sup.

To use, import into creo via options tab or place in directory your current config.pro reads from.

This file sets up defaults for metric and uses templates (not included) from Windchill server. If possible use a local directory.
