#### This is my unsensible Neovim configuration

<p align="center">
    <img src="https://raw.githubusercontent.com/vzze/nvimrc/master/preview.png">
</p>

#### Configuring

You can edit some of the features through the `lua/config.lua` file.
```lua
V.terminal.unix = "bash"
V.terminal.windows = "pwsh.exe"

V.add_pairs = {
    { "<", ">", before="%a" }
}
```
