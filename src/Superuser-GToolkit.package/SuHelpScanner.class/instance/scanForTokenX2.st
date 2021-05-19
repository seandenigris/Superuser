generated
scanForTokenX2
	self step.
	currentCharacter == $-
		ifTrue: [ self step.
			(currentCharacter <= Character backspace
				or: [ (currentCharacter
						between: (Character value: 14)
						and: Character arrowDown) or: [ currentCharacter >= $! ] ])
				ifTrue: [ [ self recordMatch: #(3).
					self step.
					currentCharacter <= Character backspace
						or: [ (currentCharacter
								between: (Character value: 14)
								and: Character arrowDown) or: [ currentCharacter >= $! ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	^ self reportLastMatch