local wezterm = require("wezterm")

return {
    font = wezterm.font("Fira Code"),
    font_size = 15.0,

    use_ime = true,
    window_background_opacity = 0.8,
    window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10,
    },
    macos_window_background_blur = 20,

    initial_cols = 100,
    initial_rows = 30,

    show_tabs_in_tab_bar = true,

    window_frame = {
        inactive_titlebar_bg = "none",
        active_titlebar_bg = "none",
    },

    window_background_gradient = {
        colors = { "#000000" },
    },

    colors = {
        tab_bar = {
            inactive_tab_edge = "none",
        },
    },
}
