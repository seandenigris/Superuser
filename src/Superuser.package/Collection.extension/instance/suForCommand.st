*Superuser
suForCommand
	"Put a space between the string representations - seems like a reasonable default"
	^ String streamContents: [ :str |
			self
				do: [ :e | str << e suForCommand ]
				separatedBy: [ str space ] ]