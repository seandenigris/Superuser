Class {
	#name : 'SuFFprobeOutput',
	#superclass : 'Object',
	#traits : 'PeTRawDataHolder',
	#classTraits : 'PeTRawDataHolder classTrait',
	#category : 'Superuser-Core',
	#package : 'Superuser',
	#tag : 'Core'
}

{ #category : 'as yet unclassified' }
SuFFprobeOutput class >> fromString: aString [ 

	| aDictionary |
	aDictionary := STON fromString: aString.
	^ self new
		rawData: aDictionary;
		yourself
]

{ #category : 'as yet unclassified' }
SuFFprobeOutput >> duration [

	^ self 
		rawDataAt: { #format. #duration }
		reader: [ :durationString | durationString asNumber seconds ]
]

{ #category : 'as yet unclassified' }
SuFFprobeOutput >> format [

	^ self rawDataAt: #format
]

{ #category : 'as yet unclassified' }
SuFFprobeOutput >> height [

	^ self 
		rawDataAt: { #streams. 1. #height }
		reader: [ :durationString | durationString asNumber ]
]

{ #category : 'as yet unclassified' }
SuFFprobeOutput >> resolution [

	^ self width @ self height
]

{ #category : 'as yet unclassified' }
SuFFprobeOutput >> videoFrameRate [

	^ self 
		rawDataAt: { #streams. 1. #r_frame_rate }
		reader: [ :aString | (Fraction readFrom: aString) rounded ]
]

{ #category : 'as yet unclassified' }
SuFFprobeOutput >> width [

	^ self 
		rawDataAt: { #streams. 1. #width }
		reader: [ :aString | aString asNumber ]
]
