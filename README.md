# custom_neovim

Keymappings:


Bugs:
1. The <Leader>ff is mapped to vim.lsp.buf.format() which is causing in delay of opening of the telescope finder


Desired feature:
1. Syntax highlighting for variable names 
2. In Navigator plugin: Edit in preview mode 

Certainly! Here's a formatted table of your key mappings:

| Key Binding     | Command                                        | Description                                        |
|-----------------|------------------------------------------------|----------------------------------------------------|
| `<Space>`       | `<Nop>`                                        | No operation (disabled space key)                   |
| `kj`            | `<ESC>`                                        | Map `kj` to `<ESC>` in insert mode                  |
| `jk`            | `<ESC>`                                        | Map `jk` to `<ESC>` in insert mode                  |
| `j`             | `gj`                                           | Move down one line                                 |
| `k`             | `gk`                                           | Move up one line                                   |
| `<C-s>`         | `:w<CR>`                                       | Save the current buffer                            |
| `<C-e>`         | `:e!<CR>`                                      | Reload the current buffer                          |
| `<A-a>y`        | `ggVGy<CR>`                                    | Select and yank the entire file                     |
| `<A-a>d`        | `ggVGd<CR>`                                    | Select and delete the entire file                   |
| `<A-a>x`        | `ggVGx<CR>`                                    | Select and cut the entire file                      |
| `<S-l>`         | `:bnext<CR>`                                   | Switch to the next buffer                           |
| `<S-h>`         | `:bprevious<CR>`                               | Switch to the previous buffer                       |
| `<A-l>`         | `:BufferLineMoveNext<CR>`                       | Move to the next buffer tab                         |
| `<A-h>`         | `:BufferLineMovePrev<CR>`                       | Move to the previous buffer tab                     |
| `S`             | `:HopWordBC<CR>`                               | Hop to the next word backwards                      |
| `s`             | `:HopWordAC<CR>`                               | Hop to the next word forwards                       |
| `<C-t>`         | `:ToggleTerm<CR>`                              | Toggle the terminal                                |
| `<Plug>(YankyPutAfter)`      | -                                      | Yank and put the text after the cursor              |
| `<Plug>(YankyPutBefore)`     | -                                      | Yank and put the text before the cursor             |
| `<Plug>(YankyGPutAfter)`     | -                                      | Yank and put the text after the cursor in visual mode |
| `<Plug>(YankyGPutBefore)`    | -                                      | Yank and put the text before the cursor in visual mode |
| `<c-x>`         | `<Plug>(YankyCycleForward)`                    | Cycle forward through yank history                  |
| `<c-p>`         | `<Plug>(YankyCycleBackward)`                   | Cycle backward through yank history                 |
| `]p`            | `<Plug>(YankyPutIndentAfterLinewise)`          | Put the yanked text with indent after the current line |
| `[p`            | `<Plug>(YankyPutIndentBeforeLinewise)`         | Put the yanked text with indent before the current line |
| `]P`            | `<Plug>(YankyPutIndentAfterLinewise)`          | Put the yanked text with indent after the current line |
| `[P`            | `<Plug>(YankyPutIndentBeforeLinewise)`         | Put the yanked text with indent before the current line |
| `>p`            | `<Plug>(YankyPutIndentAfterShiftRight)`        | Put the yanked text with shifted indent after the current line |
| `<p`            | `<Plug>(YankyPutIndentAfterShiftLeft)`         | Put the yanked text with shifted indent after the current line |
| `>P`            | `<Plug>(YankyPutIndentBeforeShiftRight)`       | Put the yanked text with shifted indent before the current line |
| `<P`            | `<Plug>(YankyPutIndentBeforeShiftLeft)`        | Put the yanked text with shifted indent before the current line |
| `=p`            | `<Plug>(YankyPutAfterFilter)`                   | Put the yanked text after the current line and format with filter |
| `=P`            | `<Plug>(YankyPutBeforeFilter)`                  | Put the yanked text before the current line and format with filter |
| `<A-1>`         | `:ToggleTerm  dir=<current_directory> direction=tab<CR>` | Open a terminal in a tab at the current directory |
| `<A-2>`         | `:ToggleTerm  dir=<current_directory> direction=horizontal<CR>` | Open a horizontal split terminal at the current directory |
| `<A-3>`         | `:ToggleTerm  dir=<current_directory> direction=float<CR>` | Open a floating terminal at the current directory |
| `<A-4>`         | `:ToggleTerm  dir=<current_directory> direction=vertical<CR>` | Open a vertical split terminal at the current directory |
| `<Leader>p`     | `:lua RemoveLineBreaks()<CR>p`                 | Remove line breaks from the register before pasting |
| `<Leader>gr`    | `:Git reset_hunk<CR>`                          | Reset the hunk under the cursor in Git              |
| `D`             | `"_D`                                          | Delete without yanking in visual mode               |
| `d`             | `"_d`                                          | Delete without yanking in visual mode               |
| `dd`            | `"_dd`                                         | Delete without yanking in normal mode               |
| `<A-j>`         | `:m .+1<CR>==`                                 | Move the current line down                          |
| `<A-k>`         | `:m .-2<CR>==`                                 | Move the current line up                            |
| `<A-,>`         | `A,<ESC>`                                      | Append a comma at the end of the line and exit insert mode |
| `<C-j>`         | `<C-w>j`                                       | Switch to the window below                          |
| `<C-k>`         | `<C-w>k`                                       | Switch to the window above                          |
| `<C-l>`         | `<C-w>l`                                       | Switch to the window to the right                   |
| `<C-h>`         | `<C-w>h`                                       | Switch to the window to the left                    |
| `<C-Up>`        | `:resize +2<CR>`                               | Increase the window height by 2 lines               |
| `<C-Down>`      | `:resize -2<CR>`                               | Decrease the window height by 2 lines               |
| `<C-Left>`      | `:vertical resize +2<CR>`                       | Increase the window width by 2 columns              |
| `<C-Right>`     | `:vertical resize -2<CR>`                       | Decrease the window width by 2 columns              |
| `<A-k>`         | `:move '<-2<CR>gv-gv`                          | Move the selected lines up                          |
| `<A-j>`         | `:move '>+1<CR>gv-gv`                          | Move the selected lines down                        |

Please note that I've included `<current_directory>` as a placeholder in the key mapping descriptions, and you need to replace it with the actual directory

 path you want to use.

I hope this table format helps you visualize your key mappings better. Let me know if you have any further questions!
