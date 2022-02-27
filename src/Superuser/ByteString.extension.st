Extension { #name : #ByteString }

{ #category : #'*Superuser' }
ByteString >> suAddToJSScriptTemplate: aString [ 
	^ aString, ' ', self
]
