running
runOSP

	"| process |
	process := PipeableOSProcess command: self string.
	
	^ process
			setNonBlockingOutput;
			yourself."