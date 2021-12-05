Class {
	#name : #SuFlag,
	#superclass : #Object,
	#instVars : [
		'longForm',
		'description',
		'shortForm',
		'argument'
	],
	#category : #'Superuser-Core'
}

{ #category : #accessing }
SuFlag >> argument [
	^ argument
]

{ #category : #accessing }
SuFlag >> argument: aString [
	argument := aString
]

{ #category : #private }
SuFlag >> description [

	^ description.
]

{ #category : #private }
SuFlag >> description: aString [ 

	description := aString.
]

{ #category : #accessing }
SuFlag >> longForm [

	^ longForm
]

{ #category : #private }
SuFlag >> longForm: aString [ 

	longForm := aString.
]

{ #category : #accessing }
SuFlag >> printOn: aStream [
	longForm ifNotNil: [ aStream nextPutAll: '--'; nextPutAll: longForm ].
	argument ifNotNil: [ aStream nextPutAll: '='; nextPutAll: argument ].
	shortForm ifNotNil: [ aStream nextPutAll: ', -'; nextPut: shortForm ].
	description ifNotNil: [ aStream nextPutAll: ' '; nextPutAll: description ].
]

{ #category : #accessing }
SuFlag >> shortForm [

	^ shortForm.
]

{ #category : #private }
SuFlag >> shortForm: aString [ 

	shortForm := aString.
]
