running
run
	| exitCode |
	exitCode := self isRoot
		ifTrue: [ self runRoot ]
		ifFalse: [ 
			self shell runAndWait: self string.
			exitCode = 0 ifFalse: [ self signalErrorCode: exitCode ] ]