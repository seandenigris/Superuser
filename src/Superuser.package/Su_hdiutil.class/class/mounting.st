instance creation
mounting

	^ self new
		template: self binary, ' attach {diskImage}';
		yourself.