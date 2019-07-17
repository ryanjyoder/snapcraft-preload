{
    apply():: {
        local updateCommandLines(name, app) = (
            app + {
                command: "bin/snapcraft-preload $SNAP/" + app.command
            }
        ),
        apps:
            if super.apps then
                std.mapWithKey(updateCommandLines, super.apps)
            else {},
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