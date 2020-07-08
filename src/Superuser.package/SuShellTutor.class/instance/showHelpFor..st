as yet unclassified
showHelpFor: aString 

	| tokens help |
	aString ifEmpty: [ ^ '' ].
	tokens := Character space split: aString.
	tokens size = 1 ifTrue: [ | matchingCommands |
		matchingCommands := self commands select: [ :e | e binary basename beginsWith: aString ].
		help := String streamContents: [ :str |
			matchingCommands do: [ :command |
				str
					nextPutAll: command shortHelp;
					cr; cr ] ] ].
	tokens size > 1 ifTrue: [ | command |
		command := self commandNamed: tokens first.
		help := (command completionsFor: aString) printString ].
	tutorModel text: help.