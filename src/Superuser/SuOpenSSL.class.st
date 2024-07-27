"
self new isVulnerableToHeartbleed.
"
Class {
	#name : #SuOpenSSL,
	#superclass : #SuGenericUnixCommand,
	#category : #Superuser
}

{ #category : #accessing }
SuOpenSSL class >> binaryName [
	^ 'openssl'
]

{ #category : #accessing }
SuOpenSSL class >> digest [
	
	| outputFile |
	outputFile := Tempfile new.
	^ self new
		template: self binary, ' dgst -{digest} {inputFile} > {outputFile}';
		argumentAt: #outputFile put: outputFile;
		outputDecoder: [ :output |
			| outputTokens |
			outputTokens := Character space split: outputFile contents trimRight.
			outputTokens last. ];
		yourself.
	
	"Adapted from https://apple.stackexchange.com/a/230919"
]

{ #category : #utilties }
SuOpenSSL class >> isVulnerableToHeartbleed [
	"https://www.openssl.org/news/secadv_20140407.txt"
	
	| tmpOutputFile lines |
	tmpOutputFile := FileLocator imageDirectory / 'osslversion.txt'.
	Smalltalk tools shell new runAndWait: '/usr/local/Cellar/openssl/1.0.1g/bin/openssl version -a > "', tmpOutputFile fullName, '"'.
	lines := tmpOutputFile contents lines.
	^ (lines first beginsWith: 'OpenSSL 1.0.1') and: [ (lines first at: 14) ~= $g ].
	
]

{ #category : #accessing }
SuOpenSSL class >> sha256: aFileReference [
	
	^ self digest
		argumentAt: #inputFile put: aFileReference;
		argumentAt: #digest put: 'sha256';
		output
]

{ #category : #accessing }
SuOpenSSL class >> sha512: aFileReference [
	
	^ self digest
		argumentAt: #inputFile put: aFileReference;
		argumentAt: #digest put: 'sha512';
		output
]
