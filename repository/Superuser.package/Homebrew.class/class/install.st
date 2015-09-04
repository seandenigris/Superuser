as yet unclassified
install
	"From http://brew.sh/, which is insecure. A few notes:
		- GitHub changed `raw.github.com` -> `raw.githubusercontent.com` (see https://developer.github.com/changes/2014-04-25-user-content-security/)
		- I manually followed url from the secure GitHub web client, and pasted it in
		- I also added a flag to ensure SSL
	
	Run #doctor immediately after and respond to output"

	NBMacShell run: 'ruby -e "$(curl -fsSL --ssl-reqd https://raw.githubusercontent.com/Homebrew/install/master/install)"'.