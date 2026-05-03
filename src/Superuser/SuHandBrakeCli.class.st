"
Documentation at <https://handbrake.fr/docs/en/latest/cli/cli-options.html>
"
Class {
	#name : 'SuHandBrakeCli',
	#superclass : 'SuGenericUnixCommand',
	#instVars : [
		'audioBitrate',
		'inputFile',
		'outputFile',
		'presetName'
	],
	#category : 'Superuser',
	#package : 'Superuser'
}

{ #category : 'accessing' }
SuHandBrakeCli class >> binaryName [

	^ 'HandBrakeCLI'
]

{ #category : 'as yet unclassified' }
SuHandBrakeCli class >> encode: inputFile to: outputFile with: aBlock [

	| command |
	command := self new
		inputFile: inputFile;
		outputFile: outputFile;
		yourself.
		
	aBlock cull: command.
		
	command run
]

{ #category : 'accessing' }
SuHandBrakeCli >> audioBitrate [
	^ audioBitrate
]

{ #category : 'accessing' }
SuHandBrakeCli >> audioBitrate: kbSecNumber [
	"GUI options are 64, 80, 96, 112, 128, 160, 194, 224, 256, 320"

	audioBitrate := kbSecNumber
]

{ #category : 'accessing' }
SuHandBrakeCli >> inputFile [
	^ inputFile
]

{ #category : 'accessing' }
SuHandBrakeCli >> inputFile: anObject [
	inputFile := anObject
]

{ #category : 'accessing' }
SuHandBrakeCli >> outputFile [
	^ outputFile
]

{ #category : 'accessing' }
SuHandBrakeCli >> outputFile: anObject [
	outputFile := anObject
]

{ #category : 'accessing' }
SuHandBrakeCli >> presetName [
	^ presetName
]

{ #category : 'accessing' }
SuHandBrakeCli >> presetName: anObject [
	presetName := anObject
]

{ #category : 'as yet unclassified' }
SuHandBrakeCli >> template [

	^ String streamContents: [ :str |
		str << self binary << ' -i {inputFile} -o {outputFile}'.
		self presetName ifNotNil: [ :psn | str << ' --preset-import-gui -Z ' << self presetName surroundedByDoubleQuotes ].
		self audioBitrate ifNotNil: [ :ab | str << ' -B ', ab asString ] ].
]
