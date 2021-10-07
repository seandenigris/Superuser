Extension { #name : #LibC }

{ #category : #'*Superuser' }
LibC class >> runAndWait: aString [ 
	^ self system: aString
]
