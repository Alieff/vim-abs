" Vim syntax file
" Language:	ABS 
" Maintainer:	Alief <serdralfs@gmail.com> 
" Last Change:	2022 Dec

syn match absExternal		"\<import\>\(\s\+static\>\)\?"
syn keyword absExternal		import export module from uses
syn keyword absDelta		adds modifies removes delta when after
syn match absProduct            "^[ \t]*\(productline\|product\)"
syn match absProduct            "^[ \t]*\(features\)"
syn keyword absFeatureModel	root group opt allof require exclude
" absClassDecl can be followed by absTypeDef (definisi dari tipe, mis."..implements <AbsTypedef>")
syn keyword absClassDecl	extends implements interface nextgroup=absTypedef skipwhite
syn keyword absOtherKeyword	data type def case try catch Try Catch return throw await assert
syn keyword absClassDecl	class
" abs block contain: another block, region, statement cluster, comments, feature model
syn region absBlock             start=/{/ end=/}/ contains=absBlock,absRegion,@absStatementCluster,absComment,absFeatureModel
syn region absRegion            start=/(/ end=/)/ keepend  contains=absRegion,absRegionTypedef,@absStatementCluster
" abs annotation only active in absRegion / absBlock
syn region absAnnotation        start="\[" end="\]" containedin=absRegion,absBlock

syn keyword absConditional	if else switch contained 
syn keyword absRepeat		while for foreach in do contained
syn keyword absCase		case contained
syn keyword absType		boolean char byte short int long float double contained
syn keyword absType		void contained
syn keyword absTypedef		this super contained containedin=ALL
syn match absTypedef		"\(interface *\)\@<!\([\n \t!.]\)\@<=[A-Z][A-Z0-9a-z_]*"  nextgroup=absTypeParam contained 
syn match absRegionTypedef      "\([ <(]\)\@<=[A-Z0-9a-z_]*"  contained 
syn region absTypeParam          start="<" end=">" contained contains=absRegionTypedef,absTypeParam
syn keyword absConstant	        null contained
syn keyword absStatement	return contained
syn keyword absBoolean		true false True False contained
syn keyword absOperator	        var new instanceof await local contained
syn match absOperator           "[-=+%^&|*!~?:]" contained
syn match absOperator           "[-+*/%^&|.]=" contained
syn match absOperator           "/[^*/]"me=e-1  contained  
syn match absOperator           "\$" contained
syn match absOperator           "&&\|\<and\>" contained
syn match absOperator           "||\|\<x\=or\>" contained
syn match absOperator           "[!=<>]=" contained
syn match absOperator           "[<>]" contained
syn match absNumber "\<\(0[bB][0-1]\+\|0[0-7]*\|0[xX]\x\+\|\d\(\d\|_\d\)*\)[lL]\=\>" contained
syn match absNumber "\(\<\d\(\d\|_\d\)*\.\(\d\(\d\|_\d\)*\)\=\|\.\d\(\d\|_\d\)*\)\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\=" contained
syn match absNumber "\<\d\(\d\|_\d\)*[eE][-+]\=\d\(\d\|_\d\)*[fFdD]\=\>" contained
syn match absNumber "\<\d\(\d\|_\d\)*\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\>" contained
syn match absComment            "//.*$"
syn region absComment          start="/\*" end="\*/"
syn region absString		start=/"/ end=/"/ contained
syn match absIdentifier         "\([ \n\t(,]\)\@<=[a-z][_a-z0-9A-Z]*\( *(\)\@!\([ !\.,);?]\)\@=" contained contains=@absKeyword

syn cluster absKeyword        add=absConditional,absRepeat,absCase,absType,absBoolean,absOperator,absStatement,absConstant,absClassDecl
syn cluster absStatementCluster        add=absConditional,absRepeat,absCase,absType,absTypedef,absConstant,absStatement,absBoolean,
      \absOperator,absNumber,absString,absTypeParam,absIdentifier,absOtherKeyword

" HIGHLIGHTING
hi  link  absClassDecl      Keyword
hi  link  absExternal       Include
hi  link  absDelta          Keyword
hi  link  absProduct        Keyword
hi  link  absFeatureModel   Keyword
hi  link  absAnnotation     PreProc
hi  link  absString         String
hi  link  absRepeat         Repeat
hi  link  absConditional    Keyword
hi  link  absCase           Keyword
hi  link  absOtherKeyword   Keyword
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
hi  link absComment         SpecialKey
