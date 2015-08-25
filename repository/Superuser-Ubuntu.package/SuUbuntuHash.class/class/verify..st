as yet unclassified
verify: file

	| instance tmpFile outputTokens |
	instance := self all detect: [ :e | e filename = file basename ].
	tmpFile := FileReference newTempfile.
	NBMacShell run: 'md5 "', file fullName, '" > "', tmpFile fullName, '"'.
	outputTokens := Character space split: tmpFile contents trimRight.
	self assert: instance md5 = outputTokens last.