accessing
runInTerminal: aString
	"Implementation note: We decided to create and pass a file to osascript because:
		* HEREDOC form didn't seem to do anything
		* separate -e flag for each line got too complicated with all the escaping"

	| escapedString template command isSuccess applescript script scriptFile |
	escapedString := aString copyReplaceAll: '"' with: '\"'.
	template := 'tell application "Terminal"
		activate
		do script "{command}"
	end tell'.
	script := template format: {(#command -> escapedString)} asDictionary.
	scriptFile := Tempfile new
		writeStreamDo: [ :str | str nextPutAll: script ];
		yourself.
	self run: 'osascript ', scriptFile suForCommand