class mv_theeye_probes::packages {
	require('mv_theeye_probes::params')

	package {'mv_theeye_probes':
		name 		=> $mv_theeye_probes::packages,
		ensure 		=> present,
	}

}
