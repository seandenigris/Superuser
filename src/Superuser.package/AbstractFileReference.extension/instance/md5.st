*Superuser-Base
md5
	
	| tmpFile outputTokens |
	tmpFile := FileReference newTempfile.
	tmpFile parent ensureCreateDirectory.
	Smalltalk tools shell new runAndWait: 'md5 "', self fullName, '" > "', tmpFile fullName, '"'.
	outputTokens := Character space split: tmpFile contents trimRight.
	tmpFile delete.
	^ outputTokens last.