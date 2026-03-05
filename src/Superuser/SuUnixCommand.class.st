Class {
	#name : 'SuUnixCommand',
	#superclass : 'Object',
	#category : 'Superuser-Core',
	#package : 'Superuser',
	#tag : 'Core'
}

{ #category : 'as yet unclassified' }
SuUnixCommand class >> completionsFor: aString [
		
	^ self syntax completionsFor: aString.
]
