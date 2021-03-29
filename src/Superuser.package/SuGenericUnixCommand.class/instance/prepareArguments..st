accessing
prepareArguments: aCollection
	aCollection keysAndValuesDo: [ :k :v | aCollection at: k put: v suForCommand ].
	"Implementation note: This used to be `#prepareArguments`, but ImageMagick needed to insert arguments before the super send. This wasn't possible without this hook where the collection is passed in as an argument"