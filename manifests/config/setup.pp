define mv_theeye_probes::config::setup (	$port  = '1337',
	 																				$authorized_servers = ['http://localhost:3000',
																																 'http://127.0.0.1:3000']) {
	require('mv_theeye_probes::packages')
	require('mv_theeye_probes')

    file { "${mv_theeye_probes::config_path}/config/config.json":
        ensure 	=> file,
        content => template("mv_theeye_probes/config.json.erb"),
        mode 	=> "0644",
        owner 	=> 'root',
        group 	=> 'root',
				require => Package["mv_theeye_probes"],
        notify	=> Exec["mv_theeye_probes_start"],
    }
		
		exec { "mv_theeye_probes_start":
			command => "/usr/bin/nohup ${mv_theeye_probes::config_path}/node_modules/.bin/coffee ${mv_theeye_probes::config_path}/main.js.coffee &",
			unless => "/bin/ps aux | /bin/grep ${mv_theeye_probes::config_path}/main.js.coffee | /bin/grep -v 'grep'",
		}
}
