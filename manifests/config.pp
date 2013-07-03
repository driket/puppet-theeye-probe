class mv_theeye_probes::config {
	require('mv_theeye_probes::packages')
		
	vcsrepo { "${mv_theeye_probes::config_path}":
	  ensure   => present,
	  provider => git,
	  source   => 'https://github.com/driket/theeye-probes.git',
	}	
	
	include nodejs

	#package { 'express':
	 # ensure   => latest,
	  #provider => 'npm',
		#}

	#nodejs::npm { '{mv_theeye_probes::config_path}':
	 # ensure  => present,
	  #version => '2.5.9',
		#}
	
}
