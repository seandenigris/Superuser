as yet unclassified
optionDescriptionLines

	| headerStripped |
	headerStripped := self contents lines copyAfter: 'Options'.
	^ headerStripped copyUpTo: ''.