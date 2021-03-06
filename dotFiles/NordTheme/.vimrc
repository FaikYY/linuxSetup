" ######### SETTINGS ##########
syntax on
set backspace=indent,eol,start
set laststatus=2
set number
set noshowmode
set cursorline

" Tab must be 2
set sts=2
set ts=2
set sw=2

syntax on
"set split as it should be
set splitbelow
set splitright

set path+=**;
set isfname+={,}
"" gd key go to the definition on a variable
"mouse support with alacritty
set mouse=a
set ttymouse=sgr

"unicode support
scriptencoding utf-8
set encoding=utf-8

" 256bit color support for tmux
set t_Co=256


call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'ap/vim-css-color'
Plug 'uiiaoo/java-syntax.vim'
Plug 'mattn/emmet-vim'
"Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim'
Plug 'AtsushiM/search-parent.vim'
Plug 'mcchrish/nnn.vim'
Plug 'AtsushiM/sass-compile.vim'
"Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim' 
Plug 'nanotech/jellybeans.vim'
call plug#end()

"colorscheme nord
"### SETTINGS FOR DRACULA ###
colorscheme dracula
set termguicolors
"######################
"***********************************



" ######### NERDTREE ##########
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"##################################



let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode'],
      \             [ 'helloworld', 'filename'] ]
      \ },
      \ 'component': {
      \   'helloworld': 'Faik YY'
      \ },
      \ }

" Emmet leader key (at the end , needed)
let g:user_emmet_leader_key=','
 



"***************************************

" ########## KEYMAPS ##########
let mapleader = ','

"for buffer switching
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> ww :call WindowSwap#EasyWindowSwap()<CR>


nnoremap <Leader>o o<Esc>
nnoremap <leader>v :e $HOME/.vimrc<CR>
nnoremap <leader>s :wqa<CR>
nnoremap <leader><Enter> i<Enter><Esc> <CR>
inoremap <leader>s <Esc>:w <CR>
nnoremap <leader>w <C-W>
inoremap ii <Esc>

nmap <leader>n :NERDTreeToggle<CR>
inoremap <leader>.� <Esc>
nnoremap <Leader>w <C-w>

inoremap { {}<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap < <lt>><left>
inoremap " ""<left>
inoremap ' ''<left>



" Disable arrow keys to get used to vim
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"set navigation between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap H gT
nnoremap L gt
" NERDTree keymaps
"Ctrl + ww: next window
"Ctrl + wn: new tab
"f6: toggle

" ###### NNN File Manager Keys #####
" if there is nothing in the screen then launch nnn
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NnnPicker | endif
" Disable default mappings
let g:nnn#set_default_mappings = 0
" Then set your own
nnoremap <silent> <leader>nn :NnnPicker<CR>
" Or override
" Start nnn in the current file's directory
nnoremap <leader>n :NnnPicker %:p:h<CR>

" Floating window (neovim latest and vim with patch 8.2.191)
let g:nnn#layout = { 'window': { 'width': 0.6, 'height': 0.6, 'highlight': 'Debug' } }

let g:nnn#action = {
      \ '<leader>t': 'tab split',
      \ '<leader>i': 'split',
      \ '<leader>s': 'vsplit' }




" ########## COC AUTOCOMPLETE ##########
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>q   <Plug>(coc-fix)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
