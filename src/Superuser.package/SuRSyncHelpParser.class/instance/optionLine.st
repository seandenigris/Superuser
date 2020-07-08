as yet unclassified
optionLine

	| shortForm longForm description |
	shortForm := #space asParser, $, asParser negate plus flatten, $, asParser ==> #second.
	#space asParser times: 5.
	longForm := #space asParser negate plus flatten.
	description := #lf asParser negate plus flatten.
	^ optionLine := shortForm optional, #space asParser plus, longForm, #space asParser plus, description ==> [ :nodes |
		SuFlag new
			shortForm: nodes first;
			longForm: nodes third;
			description: nodes fifth;
			yourself ].