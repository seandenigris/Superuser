Class {
	#name : #SuUnixUserEntity,
	#superclass : #Object,
	#instVars : [
		'name',
		'id'
	],
	#category : 'Superuser-Core'
}

{ #category : #accessing }
SuUnixUserEntity >> id [
	^ self maLazyInstVarUsing: self idDescription
]

{ #category : #accessing }
SuUnixUserEntity >> id: aNumber [
	id := aNumber
]

{ #category : #'magritte-accessing' }
SuUnixUserEntity >> idDescription [
	<magritteDescription>
	^ MANumberDescription new
		accessor: #id;
		priority: 200;
		yourself
]

{ #category : #accessing }
SuUnixUserEntity >> name [
	^ self maLazyInstVarUsing: self nameDescription
]

{ #category : #accessing }
SuUnixUserEntity >> name: aString [
	name := aString
]

{ #category : #'magritte-accessing' }
SuUnixUserEntity >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #name;
		priority: 100;
		yourself
]

{ #category : #printing }
SuUnixUserEntity >> printOn: aStream [

	aStream
		nextPutAll: name;
		nextPutAll: ' (';
		print: id;
		nextPut: $)
]
