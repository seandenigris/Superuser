accessing
all

	| soup hashRows |
	soup := Soup fromUrl: 'https://help.ubuntu.com/community/UbuntuHashes'.
	hashRows := soup findAllTags: [ :e |
		'line862'.
		e name = 'tr' and: [ [ e td p hasClass: 'line862' ] on: Error do: [ false ] ] ].
	^ hashRows collect: [ :row | | cells |
		cells := row findAllChildTags: 'td'.
		SuUbuntuHash
			filename: cells second text trimBoth
			md5: cells first text trimBoth. ]