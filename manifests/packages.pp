class mv_theeye_probes::packages {
	require('mv_theeye_probes::params')

	package {['git-core', 'vnstat']:
		ensure 		=> present,
	}

}
