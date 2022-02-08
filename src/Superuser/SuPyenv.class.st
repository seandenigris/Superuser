"
[Here](https://hackernoon.com/reaching-python-development-nirvana-bb5692adf30c) is a great article on hackernoon

#Installation

##Mac
```shell
brew update
brew install pyenv
```

#Usage

##Install Python Version
```shell
pyenv install 3.8.6
```

##Check Current Python Version
```shell
python -V
```
##Enable ==pyenv== in Shell
Per *the docs>https://github.com/pyenv/pyenv#basic-github-checkout*, the following line can be placed in a shell configuration file or run on the CLI:
```shell
eval ""$(pyenv init -)""
```
##Set Current Version
There are a few different files checked for this info (*see here>https://github.com/pyenv/pyenv#choosing-the-python-version*. To override for the current shell, per *the docs>https://github.com/pyenv/pyenv/blob/master/COMMANDS.md#pyenv-shell*, either use the shell integration via:
```shell
pyenv shell 3.8.6
```
Or set the env var directly:
```shell
export PYENV_VERSION=3.8.6
```
"
Class {
	#name : #SuPyenv,
	#superclass : #SuGenericUnixCommand,
	#category : #'Superuser-Core'
}

{ #category : #accessing }
SuPyenv class >> binary [
	^ '/opt/homebrew/bin/pyenv' asFileReference
]

{ #category : #accessing }
SuPyenv class >> installer [
	^ self new
		template: self binary fullName, ' install {version}';
		yourself
]

{ #category : #accessing }
SuPyenv class >> listingAvailableVersions [
	^ self new
		template: self binary fullName, ' install --list';
		outputDecoder: [ :str | str lines allButFirst ];
		yourself
]

{ #category : #accessing }
SuPyenv class >> settingGlobalVersion [
	^ self new
		template: self binary fullName, ' global {version}';
		outputDecoder: [ :str | str lines allButFirst ];
		yourself
]
