Class {
	#name : #SuHelpScanner,
	#superclass : #SmaCCScanner,
	#category : 'Superuser-GToolkit'
}

{ #category : #generated }
SuHelpScanner >> emptySymbolTokenId [
	^ 12
]

{ #category : #generated }
SuHelpScanner >> errorTokenId [
	^ 13
]

{ #category : #generated }
SuHelpScanner >> scanForToken [
	self step.
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX2 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue: [ [ self recordMatch: #(4).
			self step.
			currentCharacter isSeparator
				or: [ currentCharacter == Character pageUp ] ] whileTrue.
			^ self reportLastMatch ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue:
			[ self scanForTokenX1 ].
	^ self reportLastMatch
]

{ #category : #generated }
SuHelpScanner >> scanForTokenX1 [
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
]

{ #category : #generated }
SuHelpScanner >> scanForTokenX2 [
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
]

{ #category : #generated }
SuHelpScanner >> tokenActions [
	^ #(nil nil nil #whitespace)
]
