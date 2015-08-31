actions
verify: file

	self md5 = file md5
		ifTrue: [ UIManager inform: file basename, ' verified' ]
		ifFalse: [ self error: 'The MD5 of ', file basename, ' does not match ', self secureUrl asString ]