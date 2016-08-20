accessing
maLazyFromDescriptionOf: accessorSymbol
	| currentValue defaultValue description |
	currentValue := self instVarNamed: accessorSymbol.
	currentValue ifNotNil: [ ^ currentValue ].
	description := self magritteDescription children detect: [ :desc | desc isMessage: accessorSymbol ].
	defaultValue := description default.
	self instVarNamed: accessorSymbol put: defaultValue.
	^ defaultValue