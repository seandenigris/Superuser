accessing
doesNotUnderstand: aMessage
	^ (self argumentSource isDictionary and: [ self argumentSource includesKey: aMessage selector ]) 
		ifTrue: [ self argumentSource at: aMessage selector ]
		ifFalse: [ super doesNotUnderstand: aMessage ]