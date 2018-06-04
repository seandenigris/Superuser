*Superuser-Base
md5
	
	| tmpFile outputTokens |
	tmpFile := FileReference newTempfile.
	Smalltalk tools shell run: 'md5 "', self fullName, '" > "', tmpFile fullName, '"'.
	outputTokens := Character space split: tmpFile contents trimRight.
	tmpFile delete.
	^ outputTokens last.