define mv_theeye_probes::tools::custom_tool (	$options  = [], ) {
	require('mv_theeye_probes::packages')
	require('mv_theeye_probes')

    #file { "${mv_theeye_probes::config_path}/filename":
    #    ensure 	=> file,
    #    content => template("mv_theeye_probes/filename.erb"),
    #    mode 	=> "0644",
    #    owner 	=> 'root',
    #    group 	=> 'root',
	#	require => Package["mv_theeye_probes"],
    #    notify	=> Service["mv_theeye_probes"],
    #}
}