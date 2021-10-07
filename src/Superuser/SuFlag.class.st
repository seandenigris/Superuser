Class {
	#name : #SuFlag,
	#superclass : #Object,
	#instVars : [
		'longForm',
		'description',
		'shortForm'
	],
	#category : 'Superuser-Core'
}

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
SuFlag >> shortForm [

	^ shortForm.
]

{ #category : #private }
SuFlag >> shortForm: aString [ 

	shortForm := aString.
]
