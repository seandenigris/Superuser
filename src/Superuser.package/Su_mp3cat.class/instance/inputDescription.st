magritte-accessing
inputDescription
	<magritteDescription>
	^ MAToManyRelationDescription new
		accessor: #input;
		classes: { FileLocator. FileReference. Tempfile };
		suEncoder: [ :col | self inputToString: col ];
		required: true;
		yourself