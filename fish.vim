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
syn keyword fishScriptTodo contained TODO FIXME XXX NOTE
syn match fishScriptComment "#.*$" contains=fishScriptTodo

"---------------------------------------------------------------------------------------------------------------------------/
" Constructs to follow commands
"---------------------------------------------------------------------------------------------------------------------------/

syn match fishScriptSwitch "\-[A-Za-z0-9\-_\.]\+"

syn match fishScriptEscapeCodes "\\\(\(u\d\+\)\|\(e\[\(\d\+\(;\d\+\)*\)\?m\)\)" contained display
syn match fishScriptFormatMarks "%[A-Za-z0-9]" contained display
syn region fishScriptString oneline start='"' end='"' contains=fishScriptEscapeCodes,fishScriptFormatMarks,fishScriptVariables
syn region fishScriptString oneline start="'" end="'" contains=fishScriptEscapeCodes,fishScriptFormatMarks,fishScriptVariables

syn match fishScriptVariableStart "\$" contained
syn match fishScriptVariables "\$[A-Za-z]\+\(\[\(\d\+\|\$[A-Za-z]\+\)\]\)\?" contains=fishScriptVariableStart

syn keyword fishInitializations set alias

syn keyword fishLanguageKeywords echo printf set_color

syn region fishScriptSubstitution oneline matchgroup=fishScriptBlocks start="(" end=")" transparent

syn region fishScriptTest oneline matchgroup=fishScriptTests start="\[ " end="\]" transparent
syn keyword fishScriptTest test

"---------------------------------------------------------------------------------------------------------------------------/
" Blocks in fish scripts
"---------------------------------------------------------------------------------------------------------------------------/
"syn match fishFunctionName "[A-Za-z0-9_]\+" display
syn region fishScriptFunction matchgroup=fishScriptFunctions start='function' end='end' nextgroup=fishFunctionName fold transparent

syn match fishScriptConditionals "else\( if\)\?" contained
syn region fishScriptConditional matchgroup=fishScriptConditionals start='if' skip='if' end='end' fold transparent contains=ALLBUT,fishScriptConditional


syn region fishScriptLoop matchgroup=fishScriptRepeats start='for' end='end' fold transparent



let b:current_syntax = "fish"

hi def link fishScriptTodo		Todo
hi def link fishScriptComment		Comment

hi def link fishScriptSwitch		Operator

hi def link fishScriptEscapeCodes	Constant
hi def link fishScriptFormatMarks	Constant
hi def link fishScriptString		String

hi def link fishScriptVariableStart	Operator
hi def link fishScriptVariables		Identifier
hi def link fishLanguageKeywords	Keyword

hi def link fishFunctionName		Identifier
hi def link fishScriptFunctions		Function
hi def link fishScriptConditionals	Conditional
hi def link fishScriptRepeats		Repeat
hi def link fishScriptBlocks		Type
hi def link fishScriptTest		Operator
hi def link fishScriptTests		Operator

