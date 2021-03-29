printing
printOn: aStream
	| s |
	s := [ self string ]
		on: KeyNotFound
		do: [ :e | self template ].
	aStream nextPutAll: s