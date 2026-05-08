Class {
	#name : 'SuFfprobe',
	#superclass : 'SuGenericUnixCommand',
	#instVars : [
		'input'
	],
	#category : 'Superuser-Core',
	#package : 'Superuser',
	#tag : 'Core'
}

{ #category : 'accessing' }
SuFfprobe class >> binaryName [
	^ 'ffprobe'
]

{ #category : 'as yet unclassified' }
SuFfprobe class >> durationOf: aFileReference [

	^ self new
		argumentAt: #inputFile put: aFileReference;
		outputDictionaryDo: [ :aDict |
			(aDict at: #format) 
				at: #duration
				ifPresent: [ :durationString | durationString asNumber seconds ] ];
		output
]

{ #category : 'as yet unclassified' }
SuFfprobe class >> formatOf: aFileReference [

	^ self new
		argumentAt: #inputFile put: aFileReference;
		outputDictionaryDo: [ :aDict | aDict ];
		output
]

{ #category : 'as yet unclassified' }
SuFfprobe class >> into: aFileReference [

	^ self new
		argumentAt: #inputFile put: aFileReference;
		output
]

{ #category : 'as yet unclassified' }
SuFfprobe >> initialize [

	super initialize.
	template := self binary, ' -hide_banner -v error -print_format json   -show_format -show_streams -show_chapters -show_programs   -show_stream_groups {inputFile}'.
	self outputDecoder: [ :aString |
		SuFFprobeOutput fromString: aString ].
	^ self
]

{ #category : 'as yet unclassified' }
SuFfprobe >> outputDictionaryDo: aBlock [

	self outputDecoder: [ :aString |
		| aDict |
		aDict :=  STONJSON fromString: aString.
		
		aBlock value: aDict ]
]
