let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +55 Desktop/girnarsoft-fs-rupyy/rupyy/pages/rupyy/emi-calculator/EMICalculator.js
badd +40 Desktop/girnarsoft-fs-rupyy/jobs/generators/scssGenerator.js
badd +223 Desktop/girnarsoft-fs-rupyy/rupyy/pages/rupyy/LoanDetail.js
argglobal
%argdel
$argadd ~/Desktop/girnarsoft-fs-rupyy/
edit Desktop/girnarsoft-fs-rupyy/rupyy/pages/rupyy/emi-calculator/EMICalculator.js
argglobal
balt Desktop/girnarsoft-fs-rupyy/rupyy/pages/rupyy/LoanDetail.js
let s:l = 56 - ((13 * winheight(0) + 14) / 28)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 56
normal! 036|
lcd ~/Desktop/girnarsoft-fs-rupyy
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
