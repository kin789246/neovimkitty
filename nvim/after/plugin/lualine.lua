require('lualine').setup {
    options = { theme = 'iceberg_light' },
    sections = {
        lualine_c = {
            {
                'filename',
                path = 3,
                symbols = {
                    readonly = '[r]',
                }
            }
        }
    }
}
