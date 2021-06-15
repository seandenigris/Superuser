magritte-accessing
outputDescription
	<magritteDescription>
	^ MAFileDescription new
		accessor: #output;
		default: Tempfile new;
		yourself