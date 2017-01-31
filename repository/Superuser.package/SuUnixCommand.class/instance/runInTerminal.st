as yet unclassified
runInTerminal
	"Implementation note: We decided to create and pass a file to osascript because:
		* HEREDOC form didn't seem to do anything
		* separate -e flag for each line got too complicated with all the escaping"
	
	| escapedString template command isSuccess applescript script |
	escapedString := self string copyReplaceAll: '"' with: '\"'.
	template := 'tell application "Terminal"
		activate
		do script "{command}"
	end tell'.
	script := template format: { #command -> escapedString } asDictionary.
	(FileLocator imageDirectory / 'script.txt') writeStreamDo: [ :str | 
		str
			truncate;
			nextPutAll: script ].
LibC system: 'osascript ', (FileLocator imageDirectory / 'script.txt') fullName surroundedByDoubleQuotes.
	isSuccess := UIManager default confirm: 'Did command succeed?'.
	^ isSuccess
			ifTrue: [ 0 ]
			ifFalse: [ -1 ]