as yet unclassified
contents

	| tmpOutputFile |
	tmpOutputFile := FileLocator imageDirectory / ('tmp', DateAndTime now asString asLegalSelector).
	NBMacShell run: 'rsync -h > "', tmpOutputFile fullName, '"'.
	^ tmpOutputFile contents.