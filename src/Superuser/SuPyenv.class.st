"
!Installation
!!Mac
[[[language=shell
brew update
brew install pyenv
]]]
!Usage
!!Install Python Version
[[[language=shell
pyenv install 3.8.6
]]]
!!Check Current Python Version
[[[language=shell
python -V
]]]
!!Enable ==pyenv== in Shell
Per *the docs>https://github.com/pyenv/pyenv#basic-github-checkout*, the following line can be placed in a shell configuration file or run on the CLI:
[[[language=shell
eval ""$(pyenv init -)""
]]]
!!Set Current Version
There are a few different files checked for this info (*see here>https://github.com/pyenv/pyenv#choosing-the-python-version*. To override for the current shell, per *the docs>https://github.com/pyenv/pyenv/blob/master/COMMANDS.md#pyenv-shell*, either use the shell integration via:
[[[language=shell
pyenv shell 3.8.6
]
Or set the env var directly:
[[[language=shell
export PYENV_VERSION=3.8.6
]
"
Class {
	#name : #SuPyenv,
	#superclass : #SuGenericUnixCommand,
	#category : 'Superuser-Core'
}
