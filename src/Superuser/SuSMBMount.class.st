"
I should probably be a ""real"" Applescript command.

NB. QNAP's manual [suggests](https://docs.qnap.com/nas-outdated/4.1/SMB/en/index.html?connect_shares_maclinux.htm) that there should be a colon before the path, not sure if that's right/wrong/optional.
"
Class {
	#name : #SuSMBMount,
	#superclass : #SuGenericUnixCommand,
	#category : #'Superuser-Core'
}

{ #category : #accessing }
SuSMBMount >> initialize [
	super initialize.
	template := '/usr/bin/osascript -e ''mount volume "smb://{user}@{server}/{share}"'''. 
	"The above is only necessary if you want to mount in Volumes on a more recent macOS, due to security restrictions on that folder. If not, you can do something more straightforward like this: `mkdir -p ./parent/target mount -t smbfs //user@10.0.0.0/home ./parent/target`
	Reference: https://apple.stackexchange.com/a/303595"
]
