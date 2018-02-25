as yet unclassified
runOSP

	"| process |
	process := PipeableOSProcess command: self string.
	
	^ process
			setNonBlockingOutput;
			yourself."