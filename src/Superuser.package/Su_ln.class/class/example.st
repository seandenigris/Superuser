examples
example
	<gtExample>
	| original link result |
	original := Tempfile new ensureCreateFile.
	link := Tempfile new ensureCreateDirectory.
	result := Su_ln new
		original: original;
		link: link;
		yourself.
	result run.
	self assert: (link / original base) exists.