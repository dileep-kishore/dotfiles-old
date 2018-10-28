
import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")

    // Input
    //
    // Remove the default bindings here by uncommenting the below line:
    oni.input.unbind("<c-t>")
    oni.input.unbind("<c-\\>")

    // Add input bindings here:
    //
    oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))
    oni.input.bind("<Tab>", "contextMenu.select")
    oni.input.bind("<c-\\>", "sidebar.toggle")
}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
    //add custom config here, such as

    "ui.colorscheme": "gruvbox",
    "tabs.mode": "tabs",
    "tabs.height": "2em",
    "tabs.showIndex": true,

    //"oni.useDefaultConfig": true,
    //"oni.bookmarks": ["~/Documents"],
    "oni.loadInitVim": true,

    // UI customizations
    "editor.fontSize": "14px",
    "editor.fontFamily": "FuraCode Nerd Font",
    "editor.fontLigatures": true,
    "editor.renderer": "webgl",
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
    "sidebar.enabled": false,
    "sidebar.default.open": false,
    "oni.hideMenu": true,
    "statusbar.enabled": true,

    "editor.textMateHighlighting.enabled": true,
    "statusbar.enabled": false,
}
