actions
exclude: file
	"Sticky (i.e. follows moved files). Add -p flag for unsticky
	From: http://www.macworld.com/article/2033804/control-time-machine-from-the-command-line.html"
	^ ('tmutil addexclusion', file) asSuCommand asRoot