local wezterm = require 'wezterm'

return {
    color_scheme = 'tokyonight',

    font = wezterm.font('Fira Code'),
    font_size = 15.0,

    initial_cols = 100,
    initial_rows = 30,

    window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10,
    },
}
