as yet unclassified
runInTerminal
	"HEREDOC form didn't seem to do anything"
	
	| escapedString template command isSuccess |
	escapedString := self string copyReplaceAll: '"' with: '\"'.
	template := 'osascript <<END
tell application "Terminal"
do script "{command}"
end tell
END'.
	command := template format: { #command -> escapedString } asDictionary.
	LibC system: command.
	isSuccess := UIManager default confirm: 'Did command succeed?'.
	^ isSuccess
			ifTrue: [ 0 ]
			ifFalse: [ -1 ]