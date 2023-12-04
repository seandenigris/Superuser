Extension { #name : #AbstractFileReference }

{ #category : #'*Superuser' }
AbstractFileReference >> asCliString [

	^ (self fullName includes: $!)
		ifFalse: [ self fullName surroundedByDoubleQuotes ]
		ifTrue: [ self fullName surroundedBySingleQuotes ]
		
	"Reference: https://unix.stackexchange.com/a/33340"
]

{ #category : #'*Superuser-private' }
AbstractFileReference >> checksums [
	^ self contents
]

{ #category : #'*Superuser' }
AbstractFileReference >> isMD5Equal: aReference [
	^ self md5 = aReference md5
	
	"Implementation note: While not as portable, the current implementation was profiled as 438 times faster than this Smalltalk version (although it seemed maybe the primitive wasn't available):
```smalltalk
	| sourceHash targetHash |
	sourceHash := self binaryReadStreamDo: [ :str | MD5 hashStream: str ].
	targetHash := aReference binaryReadStreamDo: [ :str | MD5 hashStream: str ].
	^ sourceHash = targetHash.
```
"
]

{ #category : #'*Superuser-Base' }
AbstractFileReference >> md5 [
	
	| tmpFile outputTokens |
	tmpFile := FileReference newTempfile.
	tmpFile parent ensureCreateDirectory.
	Smalltalk tools shell new runAndWait: 'md5 "', self fullName, '" > "', tmpFile fullName, '"'.
	outputTokens := Character space split: tmpFile contents trimRight.
	tmpFile delete.
	^ outputTokens last.
]

{ #category : #'*Superuser-Base' }
AbstractFileReference >> sha256 [
	
	^ SuOpenSSL new sha256: self
]

{ #category : #'*Superuser' }
AbstractFileReference >> suForCommand [

	^ self asCliString.
]

{ #category : #'*Superuser' }
AbstractFileReference >> suOpenWith: application [
	SuGenericUnixCommand new
		template: 'open -a "{application}" "{file}"';
		argumentAt: #application put: application applicationName;
		argumentAt: #file put: self fullName;
		run.
]

{ #category : #'*Superuser-Base' }
AbstractFileReference >> verifySha256Equals: checksumSource [
	| template outputFile command checksums checksumLine |
	checksums := checksumSource checksums.
	checksumLine := checksums lines
		detect: [ :e | e endsWith: ' *', self basename ].
	template := 'cd "{folder}"; shasum -ba 256 "{file}" > "{outputFile}"'.
	outputFile := '/tmp' asFileReference / DateAndTime new asString asValidSelector.
	command := template format: { 
		#folder -> self parent fullName.
		#file -> self basename.
		#outputFile -> outputFile fullName } asDictionary.
	LibC system: command.
	self assert: outputFile contents trimBoth = checksumLine.
]
