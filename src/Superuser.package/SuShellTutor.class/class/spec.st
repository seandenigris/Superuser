as yet unclassified
spec
	<spec: #default>

	^ SpecLayout composed
			newRow: [ :row | 
				row 
					add: #shellModel; 
					add: #tutorModel ];
			yourself.