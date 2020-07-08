as yet unclassified
commandNamed: aString 

	^ SuUnixCommand subclasses detect: [ :e | e binary basename = aString ].