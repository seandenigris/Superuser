magritte-accessing
inputToString: anObject
	| isFile |
	isFile := (anObject isKindOf: Collection) not.
	^ (isFile and: [ anObject isDirectory ])
			ifTrue: [ ' -dir ', anObject suForCommand ]
			ifFalse: [ anObject suForCommand ]	