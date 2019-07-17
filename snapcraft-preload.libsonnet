{
    apply():: {
        local updateCommandLines(name, app) = (
            app + {
                "command-chain"+: [
                    "bin/snapcraft-preload",
                ],
            }
        ),
        apps: (
            if std.length(super.apps) > 0 then
                std.mapWithKey(updateCommandLines, super.apps)
            else {}
        ),
        parts+: {
            "snapcraft-preload": {
                source: "https://github.com/sergiusens/snapcraft-preload.git",
                plugin: "cmake",
                "build-packages": [
                    "gcc-multilib",
                    "g++-multilib",
                ],
            },
        },
    },
}