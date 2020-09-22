generated
visitOptionLine: anOptionLine
	| option |
	option := SuFlag new
		description: anOptionLine desc value;
		yourself.
	anOptionLine forms long ifNotNil: [ :f | option longForm: f value ].
	anOptionLine forms short ifNotNil: [ :f | option shortForm: f value ].
	self options add: option