as yet unclassified
excludePreviewsFromTimeMachine
	"They can be huge and can be easily regenerated
	Reference: http://macperformanceguide.com/Mac-TimeMachine-excluding.html"
	SuTimeMachine new exclude: self previewFile.
	self assert: (SuTimeMachine new isExcluded: self new previewFile) runInTerminal = 0