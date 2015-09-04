*Superuser-Base
verifySha256Equals: checksumSource
	| template outputFile command checksums checksumLine |
	checksums := checksumSource checksums.
	checksumLine := checksums lines
		detect: [ :e | e endsWith: ' *', self basename ].
	template := 'cd "{folder}"; shasum -ba 256 "{file}" > "{outputFile}"'.
	outputFile := '/tmp' asFileReference / DateAndTime new asString asLegalSelector.
	command := template format: { 
		#folder -> self parent fullName.
		#file -> self basename.
		#outputFile -> outputFile fullName } asDictionary.
	NBMacShell run: command.
	self assert: outputFile contents trimBoth = checksumLine.