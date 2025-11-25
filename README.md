This is a very minimal NeoVim plugin to smoothly copy and paste using System clipboard

## Installation

With `lazy.nvim`:

```lua
{
  "haphamdev/copier.nvim",
  dependencies = {
    "zdcthomas/yop.nvim",
  },
  config = function()
    require("copier").setup()
  end,
},

```

## Usage

In Normal or Visual mode, use `cp` to copy to and `cv` to paste from your system clipboard. `cp` and `cv` are operators, which means you can combine them with motions. For example: `cviw` to paste and overwrite the word under cursor, or `cpfa` to copy text from the cursor until the next letter `a`.

- `cpp` to copy the current line
- `cvv` to paste at current position
