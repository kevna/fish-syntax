" Vim syntax file
" Language:		fish shell (fish)
" Maintainer:		kevna (Aaron Moore)
"
" Latest Revision:	5 December 2013

if exists("B:current_syntax")
	finish
endif

syn match fishScriptComment "#.*$"

syn keyword fishInitializations set alias

syn keyword fishLanguageKeywords echo printf set_color

syn region fishSubstitution oneline start="(" end=")"

syn region fishScriptFunction start='function \[A-Za-z_\]*' end="end" fold



let b:current_syntax = "fish"

hi def link fishScriptComment		Comment
hi def link fishLanguageKeywords	Statement
hi def link fishInitializations		Statement
hi def link fishSubstitution		Type
hi def link fishScriptFunction		Type

