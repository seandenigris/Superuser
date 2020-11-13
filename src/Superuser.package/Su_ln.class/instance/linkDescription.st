magritte-accessing
linkDescription
	<magritteDescription>
	^ MAFileDescription new
		accessor: #link;
		required: true;
		comment: 'If set to an existing directory, link will be placed in it with same name as original';
		yourself