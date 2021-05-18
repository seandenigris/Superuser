accessing
basicCommandString
	| varClose variable tokens desc |
	desc := self magritteDescription.
	varClose := $\ asPParser not, $} asPParser.
	variable := $\ asPParser not, ${ asPParser, varClose negate plus flatten, varClose ==> [ :nodes |
		| varName fieldDesc |
		varName := nodes third asSymbol.
		fieldDesc := desc detect: [ :e | e name = varName ].
		fieldDesc suEncoder cull: (fieldDesc read: self) ].
	tokens := variable sea star parse: self template.
	^ String streamContents: [ :s | tokens do: [ :e | s << e ] ]