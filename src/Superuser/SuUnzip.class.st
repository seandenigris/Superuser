Class {
	#name : #SuUnzip,
	#superclass : #SuGenericUnixCommand,
	#instVars : [
		'source',
		'target'
	],
	#category : 'Superuser-Core'
}

{ #category : #accessing }
SuUnzip >> argumentSource [
	^ {
		#source -> self source.
		#target -> self target } asDictionary
]

{ #category : #accessing }
SuUnzip >> initialize [
	super initialize.
	template := 'unzip {source} -d {target}'.
]

{ #category : #accessing }
SuUnzip >> source [
	^ self maLazyInstVarUsing: self sourceDescription
]

{ #category : #accessing }
SuUnzip >> source: aMAMemoryFileModel [
	source := aMAMemoryFileModel
]

{ #category : #'magritte-accessing' }
SuUnzip >> sourceDescription [
	<magritteDescription>
	^ MAFileDescription new
		accessor: #source;
		required: true;
		yourself
]

{ #category : #accessing }
SuUnzip >> target [
	^ self maLazyInstVarUsing: self targetDescription
]

{ #category : #accessing }
SuUnzip >> target: aMAMemoryFileModel [
	target := aMAMemoryFileModel
]

{ #category : #'magritte-accessing' }
SuUnzip >> targetDescription [
	<magritteDescription>
	^ MAFileDescription new
		accessor: #target;
		required: true;
		yourself
]
