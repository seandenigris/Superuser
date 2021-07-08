*Superuser
suOpenWith: application
	SuGenericUnixCommand new
		template: 'open -a "{application}" "{file}"';
		argumentAt: #application put: application applicationName;
		argumentAt: #file put: self fullName;
		run.