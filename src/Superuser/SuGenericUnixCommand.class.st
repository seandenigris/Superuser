"
# Configuration
If your binary for a subclass is not reachable via the default path, send {{gtMethod:SuGenericUnixCommand class>>#binaryFolder:}} 

# Optional Arguments
I utilize Pharo's {{gtMethod:String>>#format:}}, which requires all templated variables be supplied. One way to handle optional arguments is to override {{gtMethod:SuGenericUnixCommand>>#prepareArguments:}} to supply default values for optional arguments. Here is an example:{{gtMethod:SuImageMagick>>#prepareArguments:|expanded=true|label=an example}}
# Output
Instead of *running* a command, you can get its *output*. Here's an example that also shows how to decode boring string output into a real, live object: {{gtExample:SuGenericUnixCommand class>>#exampleOutputDecoder}}
# Shell Syntax, Esoteric
() - run group of commands in subshell
{} - run group of commands in current shell; must have semi-colon after last command & spaces inside braces

## Special Variables
$! - last started background process in this shell
$? - last exit code
"
Class {
	#name : #SuGenericUnixCommand,
	#superclass : #SuRunnable,
	#instVars : [
		'administrator',
		'isBackground',
		'outputRedirect',
		'redirectErrorsToOutput',
		'isRoot',
		'outputDecoder'
	],
	#classVars : [
		'DefaultAdminUsername'
	],
	#classInstVars : [
		'binaryFolder'
	],
	#category : #'Superuser-Core'
}

{ #category : #accessing }
SuGenericUnixCommand class >> binary [
	^ self binaryFolder 
		ifNil: [ self binaryName ]
		ifNotNil: [ :folder | (folder / self binaryName) fullName ]
]

{ #category : #accessing }
SuGenericUnixCommand class >> binaryFolder [

	^ binaryFolder
]

{ #category : #accessing }
SuGenericUnixCommand class >> binaryFolder: anObject [

	binaryFolder := anObject
]

{ #category : #accessing }
SuGenericUnixCommand class >> binaryName [
	self subclassResponsibility
]

{ #category : #private }
SuGenericUnixCommand class >> defaultAdminUsername [
	| prefFile |
	DefaultAdminUsername ifNotNil: [ ^ DefaultAdminUsername ].
	
	prefFile := FileLocator preferences / 'pharo' / 'suDefaultAdminUsername'.
	prefFile exists ifTrue: [ ^ prefFile contents trimmed ].
	
	self error: 'Default user name not set'
]

{ #category : #private }
SuGenericUnixCommand class >> defaultAdminUsername: aString [
	DefaultAdminUsername := aString
]

{ #category : #examples }
SuGenericUnixCommand class >> exampleArgumentAutoEscaped [
	<gtExample>
	| result |
	result := SuGenericUnixCommand new
		template: 'ls {1}';
		argumentAt: 1 put: FileLocator imageDirectory;
		yourself.
	result run.
	self assert: (result string matchesRegex: 'ls "/[^"]+"').
	^ result
]

{ #category : #examples }
SuGenericUnixCommand class >> exampleNoArguments [
	<gtExample>
	| result |
	result := SuGenericUnixCommand new
		template: 'ls';
		yourself.
	result run.
	^ result
]

{ #category : #accessing }
SuGenericUnixCommand class >> exampleOutputDecoder [
	<gtExample>
	| result |
	result := SuGenericUnixCommand new
		template: 'ls {folder} | grep .image';
		argumentAt: #folder put: FileLocator imageDirectory;
		outputDecoder: [ :str | str trimRight asFileReference ];
		yourself.
		
	self assert: result output equals: FileLocator image asFileReference.
	
	^ result
]

{ #category : #accessing }
SuGenericUnixCommand class >> exampleSupportFolder [
	^ BaselineOfSuperuser exampleSupportFolder
]

{ #category : #persistence }
SuGenericUnixCommand class >> restoreFrom: anObject [
	DefaultAdminUsername := anObject
]

{ #category : #accessing }
SuGenericUnixCommand class >> resultOfCommand: aString [
	^ LibC resultOfCommand: aString
]

{ #category : #'as yet unclassified' }
SuGenericUnixCommand class >> run: commandString [
	^ LibC system: commandString
]

{ #category : #accessing }
SuGenericUnixCommand class >> runInTerminal: aString [
	"Implementation note: We decided to create and pass a file to osascript because:
		* HEREDOC form didn't seem to do anything
		* separate -e flag for each line got too complicated with all the escaping"

	| escapedString template command isSuccess applescript script scriptFile |
	escapedString := aString copyReplaceAll: '"' with: '\"'.
	template := 'tell application "Terminal"
		activate
		do script "{command}"
	end tell'.
	script := template format: {(#command -> escapedString)} asDictionary.
	scriptFile := Tempfile new
		writeStreamDo: [ :str | str nextPutAll: script ];
		yourself.
	self run: 'osascript ', scriptFile suForCommand
]

{ #category : #'as yet unclassified' }
SuGenericUnixCommand class >> samplePNG_File [
	^ self exampleSupportFolder / 'sample.png'
]

{ #category : #persistence }
SuGenericUnixCommand class >> spData [
	^ DefaultAdminUsername
]

{ #category : #accessing }
SuGenericUnixCommand class >> which [
	| cmd |
	cmd := ('which ', self binary) asSuCommand.
	cmd run. "fail if non-zero return"
	^ cmd output
]

{ #category : #'as yet unclassified' }
SuGenericUnixCommand >> , anObject [

	template := self template, ' ', anObject suForCommand.
]

{ #category : #'as yet unclassified' }
SuGenericUnixCommand >> asAdministrator [

	administrator := true.
]

{ #category : #'as yet unclassified' }
SuGenericUnixCommand >> asRoot [
	self isRoot: true.
]

{ #category : #accessing }
SuGenericUnixCommand >> basicCommandString [
	"So we don't have to worry about extra spaces when adding flags, arguments, etc"
	^ super basicCommandString withBlanksCondensed
]

{ #category : #accessing }
SuGenericUnixCommand >> binary [
	^ self class binary
]

{ #category : #'command - compatibility' }
SuGenericUnixCommand >> execute [
	"This is the canonical message name from the GoF pattern, so provide it to reduce astonishment"
	^ self run
]

{ #category : #accessing }
SuGenericUnixCommand >> gtRunActionFor: anAction [

	<gtAction>
		^ anAction button
		  icon: BrGlamorousIcons go;
		  tooltip: 'Run';
		  action: [ self run ]
]

{ #category : #'as yet unclassified' }
SuGenericUnixCommand >> inBackground [

	isBackground := true.
]

{ #category : #'as yet unclassified' }
SuGenericUnixCommand >> initialize [

	super initialize.
	isBackground := false.
	redirectErrorsToOutput := false.
]

{ #category : #running }
SuGenericUnixCommand >> isAdminstrator [
	^ administrator ifNil: [ false ]
]

{ #category : #accessing }
SuGenericUnixCommand >> isRoot [
	^ self maLazyInstVarUsing: self isRootDescription
]

{ #category : #accessing }
SuGenericUnixCommand >> isRoot: anObject [
	isRoot := anObject
]

{ #category : #'as yet unclassified' }
SuGenericUnixCommand >> isRootDescription [
	<magritteDescription>
	^ MABooleanDescription new
			accessor: #isRoot;
			default: false;
			yourself
]

{ #category : #accessing }
SuGenericUnixCommand >> output [
	| rawOutput |
	rawOutput := self class resultOfCommand: self string.
	^ self outputDecoder cull: rawOutput
]

{ #category : #accessing }
SuGenericUnixCommand >> outputDecoder [
	^ outputDecoder ifNil: [ [ :str | str ] ]
]

{ #category : #accessing }
SuGenericUnixCommand >> outputDecoder: aBlock [
	outputDecoder := aBlock
]

{ #category : #accessing }
SuGenericUnixCommand >> prepareArguments: aCollection [
	aCollection keysAndValuesDo: [ :k :v | aCollection at: k put: v suForCommand ].
	"Implementation note: This used to be `#prepareArguments`, but ImageMagick needed to insert arguments before the super send. This wasn't possible without this hook where the collection is passed in as an argument"
]

{ #category : #accessing }
SuGenericUnixCommand >> printOn: aStream [
	aStream nextPutAll: '$ '.
	super printOn: aStream
]

{ #category : #'as yet unclassified' }
SuGenericUnixCommand >> redirectErrorsToOutput [
	
	redirectErrorsToOutput := true.
]

{ #category : #'as yet unclassified' }
SuGenericUnixCommand >> redirectOutputTo: aFileReference [ 

	outputRedirect := aFileReference.
]

{ #category : #running }
SuGenericUnixCommand >> run [
	| exitCode |
	self isRoot ifTrue: [ ^ self runRoot "It's not possible to get an error code in the current implementation because we punt to an external shell program" ].
	self isAdminstrator ifTrue: [ ^ self runAsAdministrator "It's not possible to get an error code in the current implementation because we punt to an external shell program" ].

	exitCode := self class run: self string.
	exitCode = 0 ifFalse: [ self signalErrorCode: exitCode ]
]

{ #category : #private }
SuGenericUnixCommand >> runAsAdministrator [
	| command |
	command := SuUnixUser current isAdmin
		ifTrue: [ self string ]
		ifFalse: [
			self string copyToClipboard.
			'su ', self class defaultAdminUsername ].
	
	^ self class runInTerminal: command
]

{ #category : #running }
SuGenericUnixCommand >> runInTerminal [
	 self class runInTerminal: self string
]

{ #category : #running }
SuGenericUnixCommand >> runOSP [

	"| process |
	process := PipeableOSProcess command: self string.
	
	^ process
			setNonBlockingOutput;
			yourself."
]

{ #category : #private }
SuGenericUnixCommand >> runRoot [
	
	^ self runAsAdministrator
]

{ #category : #running }
SuGenericUnixCommand >> signalErrorCode: exitCode [
	self error: 'Exit code ' , exitCode asString , ' returned from ' , self string
]

{ #category : #accessing }
SuGenericUnixCommand >> string [
	^ String streamContents: [ :s |
		self isRoot ifTrue: [ s nextPutAll: 'sudo ' ].
		s nextPutAll: self basicCommandString.
		outputRedirect ifNotNil: [ :target |
			s
				nextPutAll: ' > ';
				nextPutAll: target suForCommand ].
		redirectErrorsToOutput ifTrue: [ s nextPutAll: ' 2>&1' ].
		isBackground ifTrue: [ s nextPutAll: ' &' ] ].
]
