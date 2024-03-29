Class {
	#name : #SuRSyncHelpParserSpec,
	#superclass : #TestCase,
	#category : 'Superuser-Core'
}

{ #category : #'as yet unclassified' }
SuRSyncHelpParserSpec >> sampleOptionLineNoShortFlag [

	^ '     --super                 receiver attempts super-user activities
' withUnixLineEndings.
]

{ #category : #'as yet unclassified' }
SuRSyncHelpParserSpec >> sampleOptionLineShortFlag [

	^ ' -O, --omit-dir-times        omit directories when preserving times
' withUnixLineEndings.
]

{ #category : #'as yet unclassified' }
SuRSyncHelpParserSpec >> sampleOptionsSection [

	^ '
Options
 -v, --verbose               increase verbosity
 -q, --quiet                 suppress non-error messages
' withUnixLineEndings.
]

{ #category : #'as yet unclassified' }
SuRSyncHelpParserSpec >> sampleOutput [

	^ 'rsync  version 2.6.9  protocol version 29
Copyright (C) 1996-2006 by Andrew Tridgell, Wayne Davison, and others.
<http://rsync.samba.org/>
Capabilities: 64-bit files, socketpairs, hard links, symlinks, batchfiles,
              inplace, IPv6, 64-bit system inums, 64-bit internal inums

rsync comes with ABSOLUTELY NO WARRANTY.  This is free software, and you
are welcome to redistribute it under certain conditions.  See the GNU
General Public Licence for details.

rsync is a file transfer program capable of efficient remote update
via a fast differencing algorithm.

Usage: rsync [OPTION]... SRC [SRC]... DEST
  or   rsync [OPTION]... SRC [SRC]... [USER@]HOST:DEST
  or   rsync [OPTION]... SRC [SRC]... [USER@]HOST::DEST
  or   rsync [OPTION]... SRC [SRC]... rsync://[USER@]HOST[:PORT]/DEST
  or   rsync [OPTION]... [USER@]HOST:SRC [DEST]
  or   rsync [OPTION]... [USER@]HOST::SRC [DEST]
  or   rsync [OPTION]... rsync://[USER@]HOST[:PORT]/SRC [DEST]
The '''':'''' usages connect via remote shell, while ''''::'''' & ''''rsync://'''' usages connect
to an rsync daemon, and require SRC or DEST to start with a module name.

Options
 -v, --verbose               increase verbosity
 -q, --quiet                 suppress non-error messages
     --no-motd               suppress daemon-mode MOTD (see manpage caveat)
 -c, --checksum              skip based on checksum, not mod-time & size
 -a, --archive               archive mode; same as -rlptgoD (no -H)
     --no-OPTION             turn off an implied OPTION (e.g. --no-D)
 -r, --recursive             recurse into directories
 -R, --relative              use relative path names
     --no-implied-dirs       don''''t send implied dirs with --relative
 -b, --backup                make backups (see --suffix & --backup-dir)
     --backup-dir=DIR        make backups into hierarchy based in DIR
     --suffix=SUFFIX         set backup suffix (default ~ w/o --backup-dir)
 -u, --update                skip files that are newer on the receiver
     --inplace               update destination files in-place (SEE MAN PAGE)
     --append                append data onto shorter files
 -d, --dirs                  transfer directories without recursing
 -l, --links                 copy symlinks as symlinks
 -L, --copy-links            transform symlink into referent file/dir
     --copy-unsafe-links     only "unsafe" symlinks are transformed
     --safe-links            ignore symlinks that point outside the source tree
 -k, --copy-dirlinks         transform symlink to a dir into referent dir
 -K, --keep-dirlinks         treat symlinked dir on receiver as dir
 -H, --hard-links            preserve hard links
 -p, --perms                 preserve permissions
     --executability         preserve the file''''s executability
     --chmod=CHMOD           affect file and/or directory permissions
 -o, --owner                 preserve owner (super-user only)
 -g, --group                 preserve group
     --devices               preserve device files (super-user only)
     --specials              preserve special files
 -D                          same as --devices --specials
 -t, --times                 preserve times
 -O, --omit-dir-times        omit directories when preserving times
     --super                 receiver attempts super-user activities
 -S, --sparse                handle sparse files efficiently
 -n, --dry-run               show what would have been transferred
 -W, --whole-file            copy files whole (without rsync algorithm)
 -x, --one-file-system       don''''t cross filesystem boundaries
 -B, --block-size=SIZE       force a fixed checksum block-size
 -e, --rsh=COMMAND           specify the remote shell to use
     --rsync-path=PROGRAM    specify the rsync to run on the remote machine
     --existing              skip creating new files on receiver
     --ignore-existing       skip updating files that already exist on receiver
     --remove-source-files   sender removes synchronized files (non-dirs)
     --del                   an alias for --delete-during
     --delete                delete extraneous files from destination dirs
     --delete-before         receiver deletes before transfer (default)
     --delete-during         receiver deletes during transfer, not before
     --delete-after          receiver deletes after transfer, not before
     --delete-excluded       also delete excluded files from destination dirs
     --ignore-errors         delete even if there are I/O errors
     --force                 force deletion of directories even if not empty
     --max-delete=NUM        don''''t delete more than NUM files
     --max-size=SIZE         don''''t transfer any file larger than SIZE
     --min-size=SIZE         don''''t transfer any file smaller than SIZE
     --partial               keep partially transferred files
     --partial-dir=DIR       put a partially transferred file into DIR
     --delay-updates         put all updated files into place at transfer''''s end
 -m, --prune-empty-dirs      prune empty directory chains from the file-list
     --numeric-ids           don''''t map uid/gid values by user/group name
     --timeout=TIME          set I/O timeout in seconds
 -I, --ignore-times          don''''t skip files that match in size and mod-time
     --size-only             skip files that match in size
     --modify-window=NUM     compare mod-times with reduced accuracy
 -T, --temp-dir=DIR          create temporary files in directory DIR
 -y, --fuzzy                 find similar file for basis if no dest file
     --compare-dest=DIR      also compare destination files relative to DIR
     --copy-dest=DIR         ... and include copies of unchanged files
     --link-dest=DIR         hardlink to files in DIR when unchanged
 -z, --compress              compress file data during the transfer
     --compress-level=NUM    explicitly set compression level
 -C, --cvs-exclude           auto-ignore files the same way CVS does
 -f, --filter=RULE           add a file-filtering RULE
 -F                          same as --filter=''''dir-merge /.rsync-filter''''
                             repeated: --filter=''''- .rsync-filter''''
     --exclude=PATTERN       exclude files matching PATTERN
     --exclude-from=FILE     read exclude patterns from FILE
     --include=PATTERN       don''''t exclude files matching PATTERN
     --include-from=FILE     read include patterns from FILE
     --files-from=FILE       read list of source-file names from FILE
 -0, --from0                 all *-from/filter files are delimited by 0s
     --address=ADDRESS       bind address for outgoing socket to daemon
     --port=PORT             specify double-colon alternate port number
     --sockopts=OPTIONS      specify custom TCP options
     --blocking-io           use blocking I/O for the remote shell
     --stats                 give some file-transfer stats
 -8, --8-bit-output          leave high-bit chars unescaped in output
 -h, --human-readable        output numbers in a human-readable format
     --progress              show progress during transfer
 -P                          same as --partial --progress
 -i, --itemize-changes       output a change-summary for all updates
     --out-format=FORMAT     output updates using the specified FORMAT
     --log-file=FILE         log what we''''re doing to the specified FILE
     --log-file-format=FMT   log updates using the specified FMT
     --password-file=FILE    read password from FILE
     --list-only             list the files instead of copying them
     --bwlimit=KBPS          limit I/O bandwidth; KBytes per second
     --write-batch=FILE      write a batched update to FILE
     --only-write-batch=FILE like --write-batch but w/o updating destination
     --read-batch=FILE       read a batched update from FILE
     --protocol=NUM          force an older protocol version to be used
 -E, --extended-attributes   copy extended attributes
     --cache                 disable fcntl(F_NOCACHE)
 -4, --ipv4                  prefer IPv4
 -6, --ipv6                  prefer IPv6
     --version               print version number
(-h) --help                  show this help (-h works with no other options)

Use "rsync --daemon --help" to see the daemon-mode command-line options.
Please see the rsync(1) and rsyncd.conf(5) man pages for full documentation.
See http://rsync.samba.org/ for updates, bug reports, and answers
' withUnixLineEndings.
]

{ #category : #'as yet unclassified' }
SuRSyncHelpParserSpec >> testAcceptance [

	| options |
	options := SuRSyncHelpParser parse: self sampleOutput.
	self assert: options size equals: 42. 
	self assert: options first shortForm equals: '-v'.
	(options at: 34) inspect.
	(options at: 35) inspect.
]

{ #category : #'as yet unclassified' }
SuRSyncHelpParserSpec >> testOptionNoShortForm [

	| option |
	option := SuRSyncHelpParser new optionLine parse: self sampleOptionLineNoShortFlag.
	self assert: option shortForm equals: nil. 
	self assert: option longForm equals: '--super'.
	self assert: option description equals: 'receiver attempts super-user activities'.
]

{ #category : #'as yet unclassified' }
SuRSyncHelpParserSpec >> testOptionShortForm [

	| option |
	option := SuRSyncHelpParser new optionLine parse: self sampleOptionLineShortFlag.
	self assert: option shortForm equals: '-O'. 
	self assert: option longForm equals: '--omit-dir-times'.
	self assert: option description equals: 'omit directories when preserving times'.
]

{ #category : #'as yet unclassified' }
SuRSyncHelpParserSpec >> testOptionsSection [

	| options |
	options := SuRSyncHelpParser new optionsSection parse: self sampleOptionsSection.
	self assert: options size equals: 2. 
	self assert: options second longForm equals: '--quiet'.
]
