entry completion
completionsFor: aString 

	| tokens |
	tokens := Character space split: aString.
	^ OrderedCollection streamContents: [ :str |
		flags do: [ :flag |
			str nextPut: flag shortForm.
			flag longForm ifNotNil: [ str nextPut: flag longForm ] ] ].