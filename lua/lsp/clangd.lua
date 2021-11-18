require'lspconfig'.clangd.setup{
    cmd = { "/usr/local//Cellar/llvm/13.0.0_1/bin/clangd", "--background-index" }
}
