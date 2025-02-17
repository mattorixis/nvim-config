local opt = vim.opt -- Упрощённое обращение к опциям

-- Интерфейс
opt.number = true -- Нумерация строк
opt.cursorline = true -- Подсвечивать текущую строку
opt.termguicolors = true -- Улучшенные цвета в терминале
opt.swapfile = false -- Отключаени swp файлов

-- Отступы и табуляция
opt.tabstop = 4 -- Длина табуляции в пробелах
opt.shiftwidth = 4 -- Размер отступов при автоотступе
opt.expandtab = true -- Использовать пробелы вместо табуляции
vim.opt.scrolloff = 5 -- Отступ сверху и снизу
-- vim.opt.smartindent = true -- Автоматический отступ для новых строк

-- Поиск
opt.ignorecase = true -- Игнорировать регистр в поиске
opt.smartcase = true -- Если есть заглавные буквы, учитывать регистр
opt.hlsearch = true -- Подсветка результатов поиска

-- Поведение окна
opt.splitright = true -- Вертикальные сплиты открываются справа
opt.splitbelow = true -- Горизонтальные сплиты открываются снизу

-- Буфер
opt.hidden = true -- Разрешить переключение между буферами без сохранения
vim.opt.clipboard = "unnamedplus" -- Использует системный буфер обмена для копирования и вставки
