set nocompatible 
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin() 

Plugin 'gmarik/Vundle.vim' "required
Plugin 'tpope/vim-fugitive' "required 
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim' "Emmet
Plugin 'nathanaelkane/vim-indent-guides' "indent 깊이 선으로 표현
Plugin 'https://github.com/scrooloose/nerdtree.git' "Tree filesystem
Plugin 'Xuyuanp/nerdtree-git-plugin' "git plugin
Plugin 'kien/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
call vundle#end()            
filetype plugin indent on " Put your non-Plugin stuff after this line

let g:Powerline_symbols = 'fancy'
nmap <F7> :NERDTree<CR>

set smartcase	" 대문자가 검색어 문자열에 포함될 때에는 noignorecase
set ignorecase 	" 검색시 대소문자 무시
set hlsearch	" 검색시 하이라이트(색상 강조)
set incsearch	" 검색 키워드 입력시 한 글자 입력할 때마다 점진 검색

set nu 		" 라인 넘버 출력
set ruler	" 현재 커서 위치 (row, col) 좌표 출력
set noerrorbells	" 에러 알림음 끄기

set bs=indent,eol,start	" backspace 키 사용 가능
set background=dark  " 검정배경을 사용할 때, (이 색상에 맞춰 문법 하이라이트 색상이 달라짐.)

set wmnu	" tab 자동완성시 가능한 목록을 보여줌
set shiftwidth=4	" shift를 4칸으로 ( >, >>, <, << 등의 명령어)
set tabstop=4		" tab을 4칸으로

set noimd		" no imdisable 한글 입력기 관련

set autoindent	" 자동 들여쓰기
set smartindent " 자동 들여쓰기 "
set cindent		" C언어 자동 들여쓰기
set laststatus=2	" 상태바를 언제나 표시할 것
set showmatch " 일치하는 괄호 하이라이팅
set sm	" 매치되는 괄호 표시
set history=1000 "  vi 편집기록 기억갯수 .viminfo에 기록

set ai  " autoindent 자동 들여쓰기 

" 사운드 벨, 비주얼 벨 비활성화
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"F11, w 로 set list 를 toggle 한다.
nnoremap <F11>w :set list!<ENTER>

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif


"syntax on
colorscheme desert
if has("syntax")
 syntax on
endif

" ESC 대용
imap jk <Esc>
imap kj <Esc>

syntax on           " 문법 강조기능
