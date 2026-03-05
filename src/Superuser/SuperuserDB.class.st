Class {
	#name : 'SuperuserDB',
	#superclass : 'SpFileDatabase',
	#category : 'Superuser-Persistence',
	#package : 'Superuser',
	#tag : 'Persistence'
}

{ #category : 'accessing' }
SuperuserDB class >> backupDirectoryParent [
	
	^ FileLocator dynabookData / 'Superuser'
]

{ #category : 'loading/saving' }
SuperuserDB class >> schema [

	^ { 
			SuGenericUnixCommand
		}.
]
