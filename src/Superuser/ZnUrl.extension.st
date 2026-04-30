Extension { #name : 'ZnUrl' }

{ #category : '*Superuser' }
ZnUrl >> checksums [
	^ self retrieveContents
]

{ #category : '*Superuser' }
ZnUrl >> suForCommand [

	^ self asString surroundedByDoubleQuotes
]
