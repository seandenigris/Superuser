baseline
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			project: 'Soup' with: [
				spec
					className: #ConfigurationOfSoup;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/PharoExtras/Soup/main/' ];
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: #'stable';
					loads: #(#Tests );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ].
		spec 
			package: #'Superuser-Shell';
			package: #Tempfile with: [
				spec repository: 'http://smalltalkhub.com/mc/SeanDeNigris/SeansPlayground/main/' ];
			package: #'Superuser-Debian' with: [
				spec requires: #(#PetitParser #Tempfile ). ];
			package: #'Superuser-Ubuntu' with: [
				spec requires: #(#Soup #Tempfile #'Superuser-Base' ). ];
			package: #'Superuser-Base'. ].
