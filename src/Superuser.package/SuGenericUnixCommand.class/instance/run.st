running
run
	self isRoot
		ifTrue: [ self runRoot "It's not possible to get an error code in the current implementation because we punt to an external shell program" ]
		ifFalse: [ 
			| exitCode |
			exitCode := self shell runAndWait: self string.
			exitCode = 0 ifFalse: [ self signalErrorCode: exitCode ] ]