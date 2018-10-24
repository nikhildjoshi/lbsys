execute pathogen#infect()

" ==========================
" =====[BASE 16 VIM]========
" ==========================
syntax on
set t_Co=256
let base16colorspace=256
let g:base16colorspace=256
set showmatch
set number

if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif
filetype plugin on

" ==========================
" ==========[CTRLP]=========
" ==========================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = '0'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git)$'


" ==========================
" =====[CLANG COMPLETE]=====
" ==========================
let g:clang_library_path='/usr/lib/llvm-3.8/lib'
let g:clang_complete_macros = 1
let g:clang_snippets_engine = 'clang_complete'
let g:clang_snippets = 1
let g:clang_conceal_snippets = 1
let g:clang_auto_select = 1
let g:clang_hl_errors = 1
let g:clang_close_preview = 1
let g:clang_periodic_quickfix = 1
let g:clang_complete_copen = 1
let g:clang_use_library = 1

" =========================
" === [ VIM GO SETTING] ===
" =========================
"let g:go_info_mode = 'gocode'
"let g:go_gocode_autobuild = 1
"let g:go_gocode_unimported_packages = 0
"let g:go_version_warning = 0
"let g:go_autodetect_gopath = 0
" ==========================
" === Vim project local ====
" ==========================

" ==========================
" =====Vim status line======
" ==========================
function! GitBranch()
	silent let f = system("git branch 2>&1 | grep \\* | cut -d ' ' -f 2 | tr -d '\n' ")
	return strlen(f) > 0 ? '🔀  '.f.'' : 'NOGIT'
endfunction

function! StatuslineGit()
  return GitBranch()
endfunction
set laststatus=2
set statusline+=%#CursorColumn#
set statusline+=%=
set statusline+=%#PmenuSel#
set statusline+=\ \ %{StatuslineGit()}\ \ 
set statusline+=%#CursorColumn#
set statusline+=\ \ \%t\%m\ 
set statusline+=%#PmenuSel#
set statusline+=\ \ \R\%l\ \│\ C\%c\ \ 
set statusline+=%#CursorColumn#
set statusline+=\ \ \0x\%B
set statusline+=\ 
