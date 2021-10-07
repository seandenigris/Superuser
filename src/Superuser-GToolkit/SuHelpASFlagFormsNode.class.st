Class {
	#name : #SuHelpASFlagFormsNode,
	#superclass : #SuHelpASOptionListNode,
	#instVars : [
		'short',
		'long'
	],
	#category : 'Superuser-GToolkit'
}

{ #category : #generated }
SuHelpASFlagFormsNode >> acceptVisitor: anOptionListVisitor [
	^ anOptionListVisitor visitFlagForms: self
]

{ #category : #generated }
SuHelpASFlagFormsNode >> long [
	^ long
]

{ #category : #generated }
SuHelpASFlagFormsNode >> long: aSmaCCToken [
	long := aSmaCCToken
]

{ #category : #generated }
SuHelpASFlagFormsNode >> short [
	^ short
]

{ #category : #generated }
SuHelpASFlagFormsNode >> short: aSmaCCToken [
	short := aSmaCCToken
]

{ #category : #generated }
SuHelpASFlagFormsNode >> tokenVariables [
	^ #(#short #long)
]
