actions
verify: file

	| instance |
	instance := self forFileNamed: file basename.
	instance verify: file.