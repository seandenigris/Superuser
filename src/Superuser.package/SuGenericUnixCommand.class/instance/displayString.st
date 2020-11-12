accessing
displayString
	"Since we're using #format: underneath, it will cause an error if we haven't yet supplied all the arguments"

	^ [ self string ]
		on: KeyNotFound
		do: [ :e | self template ]