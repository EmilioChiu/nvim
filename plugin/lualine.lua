local function time()
    local hour = os.date('%H') + 1
    return os.date(hour .. ':%M:%S')
end

require('lualine').setup {
    options = {
	theme = 'nightfly',
    },
    sections = {
	lualine_a = {'mode'},
	lualine_b = {'branch', 'diff', 'diagnostics'},
	lualine_c = {'filename'},
	lualine_x = {'encoding', 'location', 'filetype'},
	lualine_y = {'progress'},
	lualine_z = { time }
    },
}
