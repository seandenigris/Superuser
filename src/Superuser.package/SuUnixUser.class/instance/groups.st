accessing
groups
	| groupsString groupNames |
	"Adapted from https://apple.stackexchange.com/a/179531"
	groupsString := self class shell outputOf: 'id -Gn ' , self name.
	groupNames := groupsString splitOn: Character space.
	^ groupNames
		collect: [ :e | 
			SuUnixGroup new
				name: e;
				yourself ]