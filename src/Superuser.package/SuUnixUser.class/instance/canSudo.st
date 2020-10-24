as yet unclassified
canSudo
	^ (self shell outputOf: 'sudo -nv 2>&1') includesSubstring: 'Sorry'
	"Adapted from https://superuser.com/a/1281228"