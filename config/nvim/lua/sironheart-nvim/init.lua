local function init()
    require 'sironheart-nvim.vim'.init()
    require 'sironheart-nvim.theme'.init()
    require 'sironheart-nvim.languages'.init()
    require 'sironheart-nvim.telescope'.init()
    require 'sironheart-nvim.mappings'.init()
end

return {
    init = init
}
