return {} -- can't really make this to work normally
--     'Wansmer/langmapper.nvim',
--     lazy = false,
--     priority = 1,
--     opts = {},
--     init = function()
--         local ua = [['йцукенгшщзхїґфівапролджєячсмитьбю.]]
--         local UA = [[ʼЙЦУКЕНГШЩЗХЇҐФІВАПРОЛДЖЄЯЧСМИТЬБЮ,]]
--         local en = [[`qwfpgjluy;[]\arstdhneio'zxcvbkm,./]]
--         local EN = [[~QWFPGJLUY:{}|ARSTDHNEIO"ZXCVBKM<>?]]
--
--         local function escape(str)
--             local escape_chars = [[;,."|\]]
--             return vim.fn.escape(str, escape_chars)
--         end
--
--         vim.opt.langmap = vim.fn.join({
--             escape(UA) .. ';' .. escape(EN),
--             escape(ua) .. ';' .. escape(en),
--         }, ',')
--     end
-- }
