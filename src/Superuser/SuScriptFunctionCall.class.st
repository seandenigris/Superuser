Class {
	#name : #SuScriptFunctionCall,
	#superclass : #Object,
	#instVars : [
		'functionName',
		'arguments',
		'script',
		'stubMap',
		'stubScript'
	],
	#category : #'Superuser-SmalltalkCI'
}

{ #category : #accessing }
SuScriptFunctionCall class >> example [
	<gtExample>
	
	| scriptFile |
	scriptFile := Tempfile withSuffix: '.sh'.
	scriptFile writeStreamDo: [ :str |
		str << 'sdPrettyPrint() {
  local arg1=$1
  echo "The answer is $arg1"
}' withUnixLineEndings ].

	^ self new
		script: scriptFile;
		functionName: 'sdPrettyPrint';
		arguments: #('2');
		output.
]

{ #category : #accessing }
SuScriptFunctionCall class >> exampleStub [
	<gtExample>
	
	| scriptFile result |
	scriptFile := Tempfile withSuffix: '.sh'.
	scriptFile writeStreamDo: [ :str |
		str << 'sdPrettyPrint() {
  local arg1=$1
  echo "The answer is $arg1"
}' withUnixLineEndings ].

	result := self new
		script: scriptFile;
		stub: 'sdPrettyPrint' with: 'echo "Stubbed value"';
		functionName: 'sdPrettyPrint';
		arguments: #('3');
		yourself.
		
	result output trimmed should equal: 'Stubbed value'.
	
	^ result
]

{ #category : #accessing }
SuScriptFunctionCall >> arguments [
	^ arguments
]

{ #category : #accessing }
SuScriptFunctionCall >> arguments: anObject [
	arguments := anObject
]

{ #category : #accessing }
SuScriptFunctionCall >> commandString [

	^ String streamContents: [ :str |
		str << 'source ' << self script suForCommand << ' && '.
		
		self stubMap ifNotEmpty: [
			str << 'source ' << self ensureStubScript suForCommand << ' && ' ].
			
		str << self functionName surroundedByDoubleQuotes << ' ' << self arguments suForCommand ]
]

{ #category : #accessing }
SuScriptFunctionCall >> ensureStubScript [

	stubScript ifNil: [ stubScript := Tempfile withSuffix: 'stubs.sh' ].
	
	stubScript writeStreamDo: [ :str |
		self stubMap keysAndValuesDo: [ :k :v |
			str << k << '() {'; lf; 
				<< '  '; << v; lf;
				<< '}'; lf; lf ] ].
			
	^ stubScript
]

{ #category : #accessing }
SuScriptFunctionCall >> functionName [
	^ functionName
]

{ #category : #accessing }
SuScriptFunctionCall >> functionName: anObject [
	functionName := anObject
]

{ #category : #accessing }
SuScriptFunctionCall >> output [

	OSShell new
		shellCommand: self commandString
		runAndWaitOnExitDo: [ :result :outString :errString | 
			result isSuccess ifFalse: [ self error: 'tesseract failed with: ' , errString ].
			^ outString ].
]

{ #category : #accessing }
SuScriptFunctionCall >> script [
	^ script
]

{ #category : #accessing }
SuScriptFunctionCall >> script: anObject [
	script := anObject
]

{ #category : #accessing }
SuScriptFunctionCall >> stub: fncName willReturn: aString [

	self stubMap at: fncName put: aString
]

{ #category : #accessing }
SuScriptFunctionCall >> stub: fncName with: aString [ 

	self stubMap at: fncName put: aString
]

{ #category : #accessing }
SuScriptFunctionCall >> stubMap [
	^ stubMap ifNil: [ stubMap := Dictionary new ].
]

{ #category : #accessing }
SuScriptFunctionCall >> stubMap: anObject [
	stubMap := anObject
]

{ #category : #accessing }
SuScriptFunctionCall >> stubScript [
	^ stubScript
]

{ #category : #accessing }
SuScriptFunctionCall >> stubScript: anObject [
	stubScript := anObject
]
