local function init()
    require 'sironheart-nvim.vim'.init()
    require 'sironheart-nvim.theme'.init()
    require 'sironheart-nvim.languages'.init()
    require 'sironheart-nvim.telescope'.init()
    require 'sironheart-nvim.which-key'.init()
end

return {
    init = init
}
