generated
scanForTokenX1
	[ self recordMatch: #(5).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
		whileTrue.
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $/)
						or: [ (currentCharacter between: $: and: $@)
								or: [ (currentCharacter between: $[ and: $^)
										or: [ currentCharacter == $` or: [ currentCharacter >= ${ ] ] ] ] ] ])
		ifTrue: [ [ self recordMatch: #(5).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ]