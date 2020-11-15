private
runRoot
	| command |
	command := SuUnixUser current isAdmin
		ifTrue: [ self string ]
		ifFalse: [
			self string copyToClipboard.
			'su ', self class defaultAdminUsername ].
	
	^ self class runInTerminal: command