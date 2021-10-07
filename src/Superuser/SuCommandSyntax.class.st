Class {
	#name : #SuCommandSyntax,
	#superclass : #Object,
	#instVars : [
		'binary',
		'flags'
	],
	#category : 'Superuser-Core'
}

{ #category : #private }
SuCommandSyntax >> addFlag: aScFlag [ 

	flags add: aScFlag.
]

{ #category : #private }
SuCommandSyntax >> binary: aFileReference [ 

	binary := aFileReference.
]

{ #category : #'entry completion' }
SuCommandSyntax >> completionsFor: aString [ 

	| tokens |
	tokens := Character space split: aString.
	^ OrderedCollection streamContents: [ :str |
		flags do: [ :flag |
			str nextPut: flag shortForm.
			flag longForm ifNotNil: [ str nextPut: flag longForm ] ] ].
]

{ #category : #'as yet unclassified' }
SuCommandSyntax >> initialize [
	super initialize.
	flags := OrderedCollection new.
]
