accessing
exampleOutputDecoder
	<gtExample>
	| result |
	result := SuGenericUnixCommand new
		template: 'ls {folder} | grep .image';
		argumentAt: #folder put: FileLocator imageDirectory;
		outputDecoder: [ :str | str trimRight asFileReference ];
		yourself.
		
	self assert: result output equals: FileLocator image asFileReference.
	
	^ result