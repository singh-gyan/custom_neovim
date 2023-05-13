let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Desktop/girnarsoft-fs-rupyy-api
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +61 src/controllers/ApplicationController.js
badd +7 config/crons.js
badd +170 .env
badd +84 src/controllers/FSAuthController.js
badd +12 src/definitions/userdashboard.yaml
badd +17 src/controllers/UserdashboardController.js
badd +6 src/helpers/apiHelper.js
badd +8 src/definitions/application.yaml
badd +143 src/definitions/components.yaml
badd +85 src/definitions/manifest.yaml
badd +87 src/definitions/bank.yaml
badd +37 src/controllers/BankController.js
badd +31 src/middleware/cacheMiddleware.js
badd +32 src/services/calculator.js
badd +9 src/services/file.js
badd +20 src/crons/interest-details.js
badd +15 src/middleware/strategy-box.js
badd +10 config/constants.js
badd +90 src/middleware/loanboxMiddleware.js
badd +18 ~/Desktop/girnarsoft-fs-rupyy-api/src/middleware/ApplicationMiddleware.js
badd +45 ~/Desktop/girnarsoft-fs-rupyy-api/config/middleware.js
badd +46 src/controllers/LoanboxController.js
badd +20 ~/Desktop/girnarsoft-fs-rupyy-api/src/definitions/loanbox.yaml
badd +73 src/middleware/securityMiddleware.js
argglobal
%argdel
$argadd ./
edit src/middleware/securityMiddleware.js
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt src/middleware/loanboxMiddleware.js
let s:l = 73 - ((12 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 73
normal! 031|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
