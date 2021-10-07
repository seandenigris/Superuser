Extension { #name : #MAElementDescription }

{ #category : #'*Superuser' }
MAElementDescription >> suEncoder [
	"See SuRunnable class comment"
	^ self propertyAt: #suEncoder ifAbsent: #suForCommand
]

{ #category : #'*Superuser' }
MAElementDescription >> suEncoder: aValuable [
	"See suEncoder comment"
	self propertyAt: #suEncoder put: aValuable
]
