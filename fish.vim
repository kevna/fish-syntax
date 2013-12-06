" Vim syntax file
" Language:		fish shell (fish)
" Maintainer:		kevna (Aaron Moore)
"
" Latest Revision:	5 December 2013

if exists("B:current_syntax")
	finish
endif

"---------------------------------------------------------------------------------------------------------------------------/
" Comments in fish scripts
"---------------------------------------------------------------------------------------------------------------------------/
syn keyword fishTodo contained TODO FIXME XXX NOTE
syn match fishComment "#.*$" contains=fishTodo

"---------------------------------------------------------------------------------------------------------------------------/
" Constructs to follow commands
"---------------------------------------------------------------------------------------------------------------------------/

syn match fishSwitch "\-[A-Za-z0-9\-_\.]\+"

syn match fishEscapeCodes "\\\(\(u\d\+\)\|\(e\[\(\d\+\(;\d\+\)*\)\?m\)\)" contained display
syn match fishFormatMarks "%[A-Za-z0-9]" contained display
syn region fishString oneline start='"' end='"' contains=fishEscapeCodes,fishFormatMarks,fishVariables
syn region fishString oneline start="'" end="'" contains=fishEscapeCodes,fishFormatMarks,fishVariables

syn match fishVariableStart "\$" contained
syn match fishVariables "\$[A-Za-z]\+\(\[\(\d\+\|\$[A-Za-z]\+\)\]\)\?" contains=fishVariableStart

syn keyword fishInitializations set alias

syn keyword fishLanguageKeywords echo printf set_color

syn region fishSubstitution oneline matchgroup=fishBlocks start="(" end=")" transparent

syn region fishTest oneline matchgroup=fishTests start="\[ " end="\]" transparent
syn keyword fishTest test

"---------------------------------------------------------------------------------------------------------------------------/
" Blocks in fish scripts
"---------------------------------------------------------------------------------------------------------------------------/
"syn match fishFunctionName "[A-Za-z0-9_]\+" display
syn region fishFunction matchgroup=fishFunctions start='function' end='end' nextgroup=fishFunctionName fold transparent

syn match fishConditionals "else\( if\)\?" contained
syn region fishConditional matchgroup=fishConditionals start='if' skip='if' end='end' fold transparent contains=ALLBUT,fishConditional


syn region fishLoop matchgroup=fishRepeats start='for' end='end' fold transparent



let b:current_syntax = "fish"

hi def link fishTodo		Todo
hi def link fishComment		Comment

hi def link fishSwitch		Operator

hi def link fishEscapeCodes	Constant
hi def link fishFormatMarks	Constant
hi def link fishString		String

hi def link fishVariableStart	Operator
hi def link fishVariables		Identifier
hi def link fishLanguageKeywords	Keyword

hi def link fishFunctionName		Identifier
hi def link fishFunctions		Function
hi def link fishConditionals	Conditional
hi def link fishRepeats		Repeat
hi def link fishBlocks		Type
hi def link fishTest		Operator
hi def link fishTests		Operator

