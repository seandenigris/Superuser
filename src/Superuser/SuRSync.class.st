"
# Backups
What is the difference between a backup and other syncing? Well, if you think about it, one difference is that you don't necessarily want to replace different files with the same name. When syncing, you want the destination to simply mirror the source, but when backing up, you may want to keep files that are no longer there. This is enabled with the `--backup` flag and configured with the `--suffix` (how to name replaced files) and `backup-dir` (where to put them) flags. 

# Permissions
If you want to preserve ownership,  you should either run as root or as the owner of the target folder [via SO](https://stackoverflow.com/a/65844028)
#Progess, Showing
See [this ServerFault thread](https://serverfault.com/questions/219013/showing-total-progress-in-rsync-is-it-possible)
# Security/SSH
- [How to perform a secure rsync between servers across an unsecured network on ServerFault](https://serverfault.com/questions/12102/how-to-perform-a-secure-rsync-between-servers-across-an-unsecured-network) 
- [rsync all files of remote machine over SSH without root user? on StackExchange](https://unix.stackexchange.com/questions/92123/rsync-all-files-of-remote-machine-over-ssh-without-root-user)

# Spaces in path
One method is to both quote the path and escape the spaces with backslashes. There are others. See [this thread](https://unix.stackexchange.com/questions/104618) for more info.

# Verification
[Apparently](https://unix.stackexchange.com/questions/30970/does-rsync-verify-files-copied-between-two-local-drives#comment88335_30975), rsync always uses checksums *during* the transfer to make sure the copy succeeds. However, [it seems](https://unix.stackexchange.com/questions/30970/does-rsync-verify-files-copied-between-two-local-drives#comment321764_30975) there is a small possibility of error since rsync trusts the kernel that it actually wrote the correct bits. To confirm that everything went well, run again with the `-c` flag, which will use checksums ([via Unix Stack Exchange](https://unix.stackexchange.com/a/484584)) to compare the source and destination files. Finally, note that while checksum collisions are very unlikely in this context (see [here](https://stackoverflow.com/questions/4927736)),  they are theoretically possible.

# Wildcards
One creative use for wildcards is to flatten a directory structure at the destination. Let's say we have songs in directories by artist and want them on the destination all in one big folder. Putting a `*` in the source path at the appropriate part of the path will do just that ([via SO](https://stackoverflow.com/a/14663054)).

"
Class {
	#name : #SuRSync,
	#superclass : #SuUnixCommand,
	#category : #'Superuser-Core'
}

{ #category : #accessing }
SuRSync class >> binaryName [

	^ '/usr/bin/rsync' asFileReference.
]

{ #category : #accessing }
SuRSync class >> shortHelp [

	^ 'rsync is a file transfer program capable of efficient remote update
via a fast differencing algorithm.'.
]

{ #category : #accessing }
SuRSync class >> syntax [

	| flags result |
	"Implementation note: flags are alphabetized by short form, to adhere to the Smalltalk principle of typing extra characters for the sake of clarity"
	flags := { 
		SuFlag new
			longForm: '--archive';
			shortForm: '-a';
			"equivalent: 'rlptgoD';"
			description: 'archive mode; equals -rlptgoD (no -H,-A,-X)'.
		SuFlag new
			longForm: '--compress';
			shortForm: '-z';
			description: 'compress file data during the transfer'.
		SuFlag new
			longForm: '--info';
			"options: #('progress2 - total transfer progress, including % progress and transfer speed');
			versionCompatibility: '>= 3.1.0';"
			description: 'fine-grained informational verbosity'.
		SuFlag new
			longForm: '--quiet';
			shortForm: '-q';
			description: 'suppress non-error messages'.
		SuFlag new
			longForm: '--verbose';
			shortForm: '-v';
			description: 'increase verbosity'.
		SuFlag new
			longForm: '--xattrs';
			shortForm: '-X';
			description: 'preserve extended attributes'.
	}.
	result := SuCommandSyntax new
		binary: self binary;
		yourself.
	flags do: [ :f | f addFlag: f ].
	"result addArgument: (SuArgument new type: AbstractFileReference) description: 'if directory without trailing slash, copy contents to destination/source/..., if trailing slash, copy contents directly into destination/..."
	^ result
]
