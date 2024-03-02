local function time()
    local hour = os.date('%H')
    return os.date(hour .. ':%M')
end

require('lualine').setup {
    options = {
	    theme = 'nord',
    },
    sections = {
	lualine_a = {'mode'},
	lualine_b = {'branch', 'diff',},
	lualine_c = {'filename'},
	lualine_x = {'encoding', 'location', 'filetype'},
	lualine_z = { time }
    },
}
--transparent the lualine
require('transparent').clear_prefix('lualine')
