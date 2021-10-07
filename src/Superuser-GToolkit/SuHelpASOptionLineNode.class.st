Class {
	#name : #SuHelpASOptionLineNode,
	#superclass : #SuHelpASOptionListNode,
	#instVars : [
		'forms',
		'desc'
	],
	#category : 'Superuser-GToolkit'
}

{ #category : #generated }
SuHelpASOptionLineNode >> acceptVisitor: anOptionListVisitor [
	^ anOptionListVisitor visitOptionLine: self
]

{ #category : #generated }
SuHelpASOptionLineNode >> desc [
	^ desc
]

{ #category : #generated }
SuHelpASOptionLineNode >> desc: aSmaCCToken [
	desc := aSmaCCToken
]

{ #category : #generated }
SuHelpASOptionLineNode >> forms [
	^ forms
]

{ #category : #generated }
SuHelpASOptionLineNode >> forms: aSuHelpASFlagFormsNode [
	self forms notNil
		ifTrue: [ self forms parent: nil ].
	forms := aSuHelpASFlagFormsNode.
	self forms notNil
		ifTrue: [ self forms parent: self ]
]

{ #category : #generated }
SuHelpASOptionLineNode >> nodeVariables [
	^ #(#forms)
]

{ #category : #generated }
SuHelpASOptionLineNode >> tokenVariables [
	^ #(#desc)
]
