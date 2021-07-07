" Vim color file

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors



if exists (':HI') == 0
	echohl  error | echom 'Could not load martin colorsheme : HI command is missing' | echohl normal
	finish
endif


""" Initialize

set background=dark

highlight clear

if exists('syntax_on')
    syntax reset
endif


let g:colors_name="martin"




""" Common UI

HI Normal           #ffffff     -       NONE

hi CursorLine ctermbg=23 guibg=43474A gui=none term=none cterm=none
hi Visual	ctermbg=235 guibg=#262626 gui=none

if exists('&fillchars') && &fillchars !~# '\Vvert:|'
    HI VertSplit    236     bg      NONE
else
    HI VertSplit    234     234     NONE
endif


"HI SpellBad         160     bg      underline   guisp=#df0000
"HI SpellCap         189     bg      underline
"HI SpellRare        168     bg      underline
"HI SpellLocal       87      bg      underline

""" Common Syntax

HI Comment				#707070	-		-
HI Constant				brown	-		-
HI Special				5		-		-
HI Character        	174     -       -
HI Identifier			cyan	-		-
HI Type					197		-		-
HI Meta					yellow	-		-
" Not a real group, used as link
HI String				#7BC700	-		italic
HI Number           	180     -       -
HI Statement			27		-		-
HI PreProc				54		-		-
HI Underlined			-		-		underline
HI Ignore				darkgrey	-	-
HI Error				7 		1		bold
HI Todo					215		236		bold
HI Ignore				238     -       -
HI LanguagePonctuation	#F2ACE2	-		-

HI NonText			#141414		-		bold
HI SpecialKey		@NonText	-	-	 

HI Directory		darkblue	-	-
HI ErrorMsg			7		1		bold
HI Search			17		123		bold
HI IncSearch		130		221		bold
HI MoreMsg			darkgreen	-	NONE
HI ModeMsg			darkyellow	-	NONE
HI LineNr			100		-		-
HI Question			green	-		-
HI StatusLine		-		-		bold,reverse
HI StatusLineNC		-		-		reverse
HI VertSplit		-		-		reverse
HI Title			5		-		-
HI Visual			-		-		reverse
HI VisualNOS		-		-		bold,underline
HI WarningMsg		1		-		-

HI Folded			darkgrey	-	NONE
HI FoldColumn		darkgrey	-	NONE

HI WildMenu			0		3		-

HI diffAdded        green	-		-
HI diffRemoved      darkred	-		-
HI diffAdd          green	-		-
HI diffDelete       darkred	-		-
HI diffChange       darkyellow	-     -
HI diffText         bg      174     NONE



"hi WildMenu
"hi Menu
"hi Scrollbar
"hi Tooltip
"

hi Pmenu		ctermbg=235 guibg=262626	ctermfg=39	guifg=00afff
hi PmenuSel		ctermbg=22	guibg=005f00	ctermfg=87	guifg=5fffff
hi PmenuSbar	ctermbg=52	guibg=5f0000	ctermfg=202	guifg=ff5f00
hi PmenuThumb	ctermbg=53	guibg=5f005f	ctermfg=203	guifg=ff5f5f

hi link vimString	String
hi vimSetEqual		cterm=NONE		ctermfg=darkred
HI vimCommand		#0000ff	-		bold
HI vimHigroup		#C294D1	-		NONE
"hi link vimIsCommand vimHigroup

HI KeyInPair		149		-		NONE
HI ValueInPair		150		-		NONE

HI DiffAdd			119		-		bold
HI DiffChange		172		-		bold
HI DiffDelete		124		-		bold
HI DiffText			-		1		bold

HI SignColumn		-		234		bold

" Used by Gitv (is it ?)
HI DiffFile			blue	-		bold
hi link DiffNewFile		DiffFile 
hi link DiffAdded       DiffAdd
hi link	DiffChanged		DiffChange
hi link DiffRemoved		DiffDelete


" Used by GitGutter
HI GitGutterAdd					@DiffAdd		234		@DiffAdd
HI GitGutterChange				@DiffChange		234		@DiffChange
HI GitGutterDelete				@DiffDelete		234		@DiffDelete
hi link GitGutterChangeDelete	GitGutterDelete




" C/C++
"hi cParen						ctermfg=167
"hi link cBlock			cParen
hi link cType			Type
HI cStorageClass		darkblue	-	-
hi link cString			vimString

" Java
hi link javaOperator		Statement
hi link javaScopeDecl		Statement
hi link javaClassDecl		Statement
hi link javaStorageClass	Statement
hi link javaAnnotation		Meta
HI javaTypdef	-	-	NONE


" CMake
HI cmakeVariableValue	#D1B817	-	-
HI cmakeArguments		#ffffff	-	-


" HTML
hi link htmlTagName		Statement
HI htmlTag				#023996	-	-
hi link htmlEndTag	htmlTag
hi link htmlArg			KeyInPair
hi link htmlString		ValueInPair
HI htmlLink			-	-	NONE

" Javascript
HI javaScript			white	-	-
HI javaScriptGlobal		#5583CF	-	-
HI javaScriptMember		#55CFA5	-	-
hi link javaScriptBraces LanguagePonctuation
hi link javaScriptParens LanguagePonctuation


" Yaml
hi link yamlBlockMappingKey		KeyInPair
hi link yamlFlowString			vimString
"hi yamlFlowStringDelimiter ...

" Markdown
HI markdownCode				#ffb48c					-	-
HI markdownCodeDelimiter	@markdownCode<l=0.35	-	-
HI markdownLinkText			#C4441A					-	-
HI markdownUrl				#1A9AC4					-	-

" 'Desktop' file
HI dtStringKey	@KeyInPair	-	-
HI dtTypeValue	@ValueInPair	-	-

" Plugins...
" NERDTRee
HI NERDTreeDir				darkblue	-			-
HI NERDTreeLinkDir			darkcyan	-			-
" VimPlug
HI plug1					46			235			-
HI plugNumber				42			235			-
HI plugBracket				222			-			-
HI plug2					215			-			-



" Ediyalam
HI EdiyalamMessageError			blue		-		NONE


""" util

map ,hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
"vim: sw=4
