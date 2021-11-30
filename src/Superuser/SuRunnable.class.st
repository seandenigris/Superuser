"
I represent a unix-like command. 

I have a `template` with named or indexed variables, which can be filled with `arguments`. 

Subclasses must at minimum provide their own template by either:
- Many commands are so complex that the template must be set during object creation for each variant.
- For the default template, setting the inst var in `#initialize`. This is *The Smalltalk Way*.
- If there is only one template, overriding `#template` instead has the nice side-effect that one can more easily compare subclasses' templates in the browser.

# Arguments
## String Encoding
Superuser provides a bit of magic for safely representing commonly used object types on the command line. For your custom types, define ==#suForCommand==. Here are the built-in usages:
```smalltalk
#suForCommand gtImplementors
```

# Meta-Magic
Alternately, and for more (per command object) control, Magritte element descriptions  can be a great place to store the encoder. Just send {{gtMethod:MAElementDescription>>#suEncoder:}}
"
Class {
	#name : #SuRunnable,
	#superclass : #Object,
	#instVars : [
		'argumentSource',
		'template'
	],
	#category : #'Superuser-Core'
}

{ #category : #accessing }
SuRunnable >> argumentAt: key [
	^ self argumentSource at: key
]

{ #category : #accessing }
SuRunnable >> argumentAt: key put: value [
	self ensureArgumentSourceFor: key.
	self argumentSource at: key put: value.
]

{ #category : #private }
SuRunnable >> argumentSource [
	^ argumentSource ifNil: [ ^ #() ]
	"nil is perfectly acceptable to format:, but passing an empty collection prevents nil checks elsewhere e.g. argument escaping"
]

{ #category : #private }
SuRunnable >> argumentSource: anObject [
	"It is usually preferrable to set arguments via #argumentAt:put:, which will automatically handle creating and maintaining the appropriate collection for the arguments.
	
	anObject
		- Accepted input: for the moment, anything acceptable to `String>>#format:` that maps all variables in my template to string replacements. In the future, we'd like to loosen this up to allow mapping to any object's fields
		- Escaping: for types commonly passed as arguments, automatic escaping is be available. See implementors of #suForCommand"
	argumentSource := anObject
]

{ #category : #private }
SuRunnable >> basicCommandString [
	| preparedArguments |
	preparedArguments := self argumentSource copy.
	self prepareArguments: preparedArguments.
	^ (self template format: preparedArguments) withBlanksCondensed
]

{ #category : #copying }
SuRunnable >> copyToClipboard [
	<magritteAction>
	Clipboard clipboardText: self string
]

{ #category : #'reflective operations' }
SuRunnable >> doesNotUnderstand: aMessage [
	^ (self argumentSource isDictionary and: [ self argumentSource includesKey: aMessage selector ]) 
		ifTrue: [ self argumentSource at: aMessage selector ]
		ifFalse: [ super doesNotUnderstand: aMessage ]
]

{ #category : #private }
SuRunnable >> ensureArgumentSourceFor: key [ 
	| maxSize |
	argumentSource ifNotNil: [ ^ argumentSource ].
	maxSize := self template count: [ :c | c = ${ ].
	key isInteger ifTrue: [ 
		maxSize := maxSize max: key.
		argumentSource := OrderedCollection new: maxSize withAll: ''. 
		^ self ].
	key isSymbol ifTrue: [ 
		argumentSource := Dictionary new: maxSize. 
		^ self ].
	^ self error: 'Can''t use a ', key class, ' as key'.
]

{ #category : #private }
SuRunnable >> prepareArguments: aCollection [
	"Hook e.g. for arguments to be escaped or additional arguments be inserted"
]

{ #category : #printing }
SuRunnable >> printOn: aStream [
	| s |
	s := [ self string ]
		on: KeyNotFound
		do: [ :e | self template ].
	aStream nextPutAll: s
]

{ #category : #accessing }
SuRunnable >> string [
	"Hook to allow adornment e.g. Unix might insert `sudo` if root"
	^ self basicCommandString
]

{ #category : #accessing }
SuRunnable >> template [
	^ template
]

{ #category : #accessing }
SuRunnable >> template: aString [
	"aString - an argument to `String>>#format:` that will be filled with values from `#argumentSource`. NB. I can have no variables to fill."
	template := aString
]
