" Vim syntax file
" Language:	ABS based on JAVA
" Maintainer:	Alief <serdralfs@gmail.com> 
" Taken From:	Claudio Fleiner <claudio@fleiner.com> (Java)
" URL:          https://github.com/fleiner/vim/blob/master/runtime/syntax/java.vim
" Last Change:	2018 July 26

syn match absExternal		"\<import\>\(\s\+static\>\)\?"
syn keyword absExternal		import export module from
syn keyword absClassDecl	extends implements interface nextgroup=absTypedef
syn keyword absClassDecl	class
syn region absBlock             start=/{/ end=/}/ contains=absBlock,absRegion,@absStatementCluster
syn region absRegion            start=/(/ end=/)/ keepend  contains=absRegion,absRegionTypedef,@absStatementCluster
syn region absAnnotation        start="\[" end="\]" containedin=absRegion,absBlock

syn keyword absConditional	if else switch contained 
syn keyword absRepeat		while for do contained
syn keyword absCase		case contained
syn keyword absType		boolean char byte short int long float double contained
syn keyword absType		void contained
syn keyword absTypedef		this super contained containedin=ALL
syn match absTypedef		"\([\n \t!.]\)\@<=[A-Z][A-Za-z]*"  nextgroup=absTypeParam contained 
syn match absRegionTypedef      "[A-Z][A-Za-z]*"  contained 
syn region absTypeParam          start="<" end=">" contained contains=absRegionTypedef,absTypeParam
syn keyword absConstant	        null contained
syn keyword absStatement	return contained
syn keyword absBoolean		true false True False contained
syn keyword absOperator	        var new instanceof await local contained
syn match absOperator           "[-=+%^&|*!.~?:]" contained
syn match absOperator           "[-+*/%^&|.]=" contained
syn match absOperator           "/[^*/]"me=e-1  contained  
syn match absOperator           "\$" contained
syn match absOperator           "&&\|\<and\>" contained
syn match absOperator           "||\|\<x\=or\>" contained
syn match absOperator           "[!=<>]=" contained
syn match absOperator           "[<>]" contained
syn match   absNumber		 "\<\(0[bB][0-1]\+\|0[0-7]*\|0[xX]\x\+\|\d\(\d\|_\d\)*\)[lL]\=\>" contained
syn match   absNumber		 "\(\<\d\(\d\|_\d\)*\.\(\d\(\d\|_\d\)*\)\=\|\.\d\(\d\|_\d\)*\)\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\=" contained
syn match   absNumber		 "\<\d\(\d\|_\d\)*[eE][-+]\=\d\(\d\|_\d\)*[fFdD]\=\>" contained
syn match   absNumber		 "\<\d\(\d\|_\d\)*\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\>" contained
syn region absString		start=/"/ end=/"/ contained
syn match absIdentifier         "\([ \n\t(,]\)\@<=[a-z][a-z0-9A-Z]*\([ !\.,);?]\)\@=" contained contains=@absKeyword

syn cluster absKeyword        add=absConditional,absRepeat,absCase,absType,absBoolean,absOperator,absStatement,absConstant,absClassDecl
syn cluster absStatementCluster        add=absConditional,absRepeat,absCase,absType,absTypedef,absConstant,absStatement,absBoolean,
      \absOperator,absNumber,absString,absTypeParam,absIdentifier

" HIGHLIGHTING
hi  link  absClassDecl      Keyword
hi  link  absExternal       Include
hi  link  absAnnotation     PreProc
hi  link  absString         String
hi  link  absRepeat         Repeat
hi  link  absConditional    Keyword
hi  link  absCase           Keyword
hi  link  absIdentifier     Identifier
hi  link  absConstant       Constant
hi  link  absTypedef        Typedef
hi  link  absRegionTypedef  Typedef
hi  link  absTypeParam      Character
hi  link  absBoolean        Boolean
hi  link  absType           Type
hi  link  absOperator       Operator
hi  link  absStatement      Statement
hi  link  absNumber         Number
hi  link  javaSpecialChar   SpecialChar


