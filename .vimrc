
map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>

inoremap <Nul> <C-x><C-o>

"added 9/24/2017
"set number
""set relativenumber

set laststatus=2
set noruler " Ensure the status line overrides the ruler

set statusline=
set statusline+=%{StatuslineGit()}       " Git status
set statusline+=%<%F                     " File name

set statusline+=%m%r%w                       " Modified flag
"set statusline+=%m                       " Modified flag
"set statusline+=%r                       " Read-only flag
set statusline+=%=                       " Right align subsequent items
set statusline+=[%{&ff}]                 " File format (e.g., unix, dos)
set statusline+=[%Y]                     " File type
set statusline+=[%l/%L]                  " Current line/Total lines
set statusline+=[%c:%v]                  " Column:Virtual column
set statusline+=[%p%%]                   " Percentage through file

let g:git_branch_name = ''

function! UpdateGitBranchCache()
  let g:git_branch_name = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  " Clean up the output slightly
  if strlen(g:git_branch_name) > 0
    let g:git_branch_name = ' ['.g:git_branch_name.'] '
  endif
  redrawstatus
endfunction

augroup GitStatusUpdate
    autocmd!
    " Update on buffer read, write, or when cursor holds still
    autocmd BufRead,BufWritePost,CursorHold,VimEnter * call UpdateGitBranchCache()
augroup END

function! StatuslineGit()
  return g:git_branch_name
endfunction

