actions
verify: file
	"#inform: success or signal an error"

	| instance tmpFile outputTokens |
	instance := self all detect: [ :e | e filename = file basename ].
	tmpFile := FileReference newTempfile.
	NBMacShell run: 'md5 "', file fullName, '" > "', tmpFile fullName, '"'.
	outputTokens := Character space split: tmpFile contents trimRight.
	tmpFile delete.
	instance md5 = outputTokens last
		ifTrue: [ UIManager inform: file basename, ' verified' ]
		ifFalse: [ self error: 'The MD5 of ', file basename, ' does not match ', self secureUrl asString ]