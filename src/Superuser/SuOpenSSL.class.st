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
SuOpenSSL >> sha256: aFileReference [
	
	| outputTokens outputFile |
	outputFile := Tempfile new.
	self
		template: self binary, ' dgst -sha256 {inputFile} > {outputFile}';
		argumentAt: #inputFile put: aFileReference;
		argumentAt: #outputFile put: outputFile;
		run.
	outputTokens := Character space split: outputFile contents trimRight.
	^ outputTokens last.
	
	"Adapted from https://apple.stackexchange.com/a/230919"
]
