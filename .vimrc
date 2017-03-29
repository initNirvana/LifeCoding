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


"ESC 대응
imap jk <Esc>
imap kj <Esc>

"Tab
set showmode
set paste
set softtabstop=2
set expandtab
set smarttab
set nowrap
set clipboard=unnamedplus,autoselect
set noerrorbells    "에러 알림음 끄기
set laststatus=2

set ai          	" 자동 들여쓰기
set smartindent     " 자동 들여쓰기 "
set cindent	    	" C언어 자동 들여쓰기
set laststatus=2	" 상태바를 언제나 표시할 것
set showmatch       " 일치하는 괄호 하이라이팅
set sm          	" 매치되는 괄호 표시
set history=1000    " vi 편집기록 기억갯수 .viminfo에 기록

set nobackup        " 백업파일을 만들지 않음
set nojoinspaces    " J 명령어로 줄을 붙일 때 마침표 뒤에 한칸만 띔
set ruler           " 상태 표시줄에 커서 위치를 표시
set nu              " 라인넘버 출력
set wmnu            " tab 자동완성시 가능한 목록을 보여줌
set tabstop=4       " 탭간격
set shiftwidth=4    " 자동 들여쓰기 간격 ( >, >>, <, << 등의 명령어)
set cursorline

set showmatch       " 매치되는 괄호의 반대쪽을 보여줌
set title           " 타이틀바에 현재 편집중인 파일을 표시
set enc=UTF-8       " 인코딩

set hlsearch        "검색어 강조, set hls도 가능
set ignorecase      "검색시 대소문자 무시
set incsearch       "검색 키워드 입력시 한글자 입력할 때마다 점진 검색
set nowrapscan      "찾기에서 파일의 맨 끝에 이르면 계속하여 찾지 않음
set backspace=eol,start,indent " 줄의 끝, 시작, 들여쓰기에서 백스페이스시 이전줄로
set smartcase

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif


syntax on           " 문법 강조기능


