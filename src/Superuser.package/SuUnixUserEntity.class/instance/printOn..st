printing
printOn: aStream

	aStream
		nextPutAll: name;
		nextPutAll: ' (';
		print: id;
		nextPut: $)