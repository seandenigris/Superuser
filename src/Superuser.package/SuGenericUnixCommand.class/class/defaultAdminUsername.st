private
defaultAdminUsername
	^ DefaultAdminUsername ifNil: [ self error: 'Default user name not set' ]