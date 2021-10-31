Class {
	#name : #SuSSHKeyGen,
	#superclass : #SuGenericUnixCommand,
	#instVars : [
		'input'
	],
	#category : #'Superuser-Core'
}

{ #category : #examples }
SuSSHKeyGen class >> example [
	<gtExample>
	| result |
	result := self new
		argumentAt: #inputFile put: self samplePNG_File;
		yourself.
	self assert: result extent equals: 342@114.
	self assert: (result string matchesRegex: 'ffmpeg -i ".*\.png" 2>&1').
	^ result
]

{ #category : #'instance creation' }
SuSSHKeyGen class >> knownPublicKeyFingerprintForHost: aString [

	| result |
	result := self new
		template: 'ssh-keygen -F {host} -l -E {format} -f {file}';
		argumentAt: #host put: aString;
		argumentAt: #format put: 'SHA256';
		argumentAt: #file put: FileLocator home/ '.ssh' / 'known_hosts';
		yourself.
		
	^ result 
		outputDecoder: [ :str |
			str trimBoth lines ifNotEmpty: [ :l | 
				| tokens |
				tokens := l last splitOn: Character space.
				tokens last allButFirst: result format size + 1 ] ];
		yourself.
	
]
