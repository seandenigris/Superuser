Class {
	#name : #SuUnixCommand,
	#superclass : #Object,
	#category : 'Superuser-Core'
}

{ #category : #'as yet unclassified' }
SuUnixCommand class >> completionsFor: aString [
		
	^ self syntax completionsFor: aString.
]
