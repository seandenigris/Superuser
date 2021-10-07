Class {
	#name : #SuHelpASOptionListNode,
	#superclass : #SmaCCParseNode,
	#instVars : [
		'options'
	],
	#category : 'Superuser-GToolkit'
}

{ #category : #generated }
SuHelpASOptionListNode >> acceptVisitor: anOptionListVisitor [
	^ anOptionListVisitor visitOptionList: self
]

{ #category : #generated }
SuHelpASOptionListNode >> compositeNodeVariables [
	^ #(#options)
]

{ #category : #'generated-initialize-release' }
SuHelpASOptionListNode >> initialize [
	super initialize.
	options := OrderedCollection new: 2.
]

{ #category : #generated }
SuHelpASOptionListNode >> options [
	^ options
]

{ #category : #generated }
SuHelpASOptionListNode >> options: anOrderedCollection [
	self setParents: self options to: nil.
	options := anOrderedCollection.
	self setParents: self options to: self
]
