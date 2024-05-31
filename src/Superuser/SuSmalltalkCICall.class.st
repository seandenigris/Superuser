Class {
	#name : #SuSmalltalkCICall,
	#superclass : #SuScriptFunctionCall,
	#instVars : [
		'repositoryFolder'
	],
	#classVars : [
		'RepositoryFolder'
	],
	#category : #'Superuser-SmalltalkCI'
}

{ #category : #accessing }
SuSmalltalkCICall class >> repositoryFolder [
	^ RepositoryFolder
]

{ #category : #accessing }
SuSmalltalkCICall class >> repositoryFolder: anObject [
	RepositoryFolder := anObject
]

{ #category : #accessing }
SuSmalltalkCICall >> commandString [

	| template |
	template := 'source {helpersScript} && {superCommandString}'.
	^ template format: {
		#helpersScript -> (self class repositoryFolder / 'helpers.sh') suForCommand.
		#superCommandString -> super commandString 
	} asDictionary.
]

{ #category : #accessing }
SuSmalltalkCICall >> commandStringGtViewOn: aView [
	<gtView>

	^ aView textEditor
		title: 'Command';
		text: self commandString;
		priority: 25
]

{ #category : #accessing }
SuSmalltalkCICall >> repositoryFolder [
	^ repositoryFolder ifNil: [ self class repositoryFolder ]
]

{ #category : #accessing }
SuSmalltalkCICall >> repositoryFolder: anObject [
	repositoryFolder := anObject
]

{ #category : #accessing }
SuSmalltalkCICall >> stubIsARM: aBoolean [

	aBoolean
		ifTrue: [ self stub: 'hardware_platform' with: 'echo "arm64"' ]
		ifFalse: [ self stub: 'hardware_platform' with: 'echo "x86_64"' ]
]

{ #category : #accessing }
SuSmalltalkCICall >> stubPlatform: aString isARM: aBoolean [

	| platformOptions |
	platformOptions := #('linux' 'windows' 'mac').
	platformOptions do: [ :platform |
		self 
			stub: 'is_', platform, '_build' 
			with: (aString = platform) asString ].
			
	self stubIsARM: aBoolean
]

{ #category : #accessing }
SuSmalltalkCICall >> stubRelease: aString [

	self stub: 'gtoolkit::latest_release_version' with: 'echo "', aString, '"'
]
