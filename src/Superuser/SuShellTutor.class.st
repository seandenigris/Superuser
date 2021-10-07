"
self open.
"
Class {
	#name : #SuShellTutor,
	#superclass : #ComposableModel,
	#instVars : [
		'tutorModel',
		'shellModel'
	],
	#category : 'Superuser-Tutor'
}

{ #category : #'as yet unclassified' }
SuShellTutor class >> open [

	^ self new openWithSpec.
]

{ #category : #'as yet unclassified' }
SuShellTutor class >> spec [
	<spec: #default>

	^ SpecLayout composed
			newRow: [ :row | 
				row 
					add: #shellModel; 
					add: #tutorModel ];
			yourself.
]

{ #category : #'as yet unclassified' }
SuShellTutor >> commandNamed: aString [ 

	^ SuUnixCommand subclasses detect: [ :e | e binary basename = aString ].
]

{ #category : #'as yet unclassified' }
SuShellTutor >> commands [

	^ SuUnixCommand subclasses.
]

{ #category : #initialization }
SuShellTutor >> initializePresenter [

	shellModel whenTextChanged: [ :text | self showHelpFor: text ]
]

{ #category : #initialization }
SuShellTutor >> initializeWidgets [

	shellModel := self newTextInput
		autoAccept: true;
		yourself.
	tutorModel := self newText.
]

{ #category : #accessing }
SuShellTutor >> shellModel [
	^ shellModel
]

{ #category : #'as yet unclassified' }
SuShellTutor >> showHelpFor: aString [ 

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
]

{ #category : #accessing }
SuShellTutor >> tutorModel [
	^ tutorModel
]
