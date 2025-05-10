_This is **my** configuration of Neovim._
- Fast -- Startup is < 20ms, using it as a `$MANPAGER` after all
- Minimal -- _Text Editor just text editor Please [dont't](https://github.com/glepnir/nvim) do no more_
- Different -- Did some sketchy stuff here and there

## Structure
- **init.lua**: Pull _The stuff_ together (or don't when opening GPG files)
- **lua/**: _The stuff_
    - **gpg.lua**: Futile attempts to safely edit [(un)safe GPG encrypted](https://www.latacora.com/blog/2019/07/16/the-pgp-problem/) files
    - **utils.lua**: Useful functions used throughout the config
    - **options.lua**
    - **autocmds.lua**
    - **mappings.lua**: Deferred loading cuz there is too much '>.<
    - **playground.lua**: Useful functions which are... well... not very useful
    - **plugins/**: Plugin specs which are autosourced (and cached!) by Lazy.nvim
    - **configs/**: Large parts of plugin specs separated from **plugins/** to load faster

---

> _Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away._

― Antoine de Saint-Exupéry
