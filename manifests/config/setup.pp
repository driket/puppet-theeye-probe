define mv_theeye_probes::config::setup (	
	$port  = '1337',
	$authorized_servers = [
		'http://localhost:3000',
		'http://127.0.0.1:3000',
	],
	$secret_key		= '',
	$config_path 	= $mv_theeye_probes::config_path,
) 
{
	require('mv_theeye_probes::packages')
	require('mv_theeye_probes')

    file { "${mv_theeye_probes::config_path}/config/config.json":
        ensure 	=> file,
        content => template("mv_theeye_probes/config.json.erb"),
        mode 	=> "0644",
        owner 	=> 'root',
        group 	=> 'root',
				require => Package['git-core', 'vnstat'],
        notify	=> Service["${mv_theeye_probes::service_name}"],
    }
		
    file { "/etc/init.d/${mv_theeye_probes::service_name}":
        ensure 	=> file,
        content => template("mv_theeye_probes/theeye-probes.erb"),
        mode 		=> "0755",
        owner 	=> 'root',
        group 	=> 'root',
				require => Package['git-core', 'vnstat'],
    }
		
		# git hook to restart service after push
    file { "${mv_theeye_probes::config_path}/.git/hooks/post-update":
        ensure 	=> file,
        content => template("mv_theeye_probes/post-update.erb"),
        mode 	=> "0755",
        owner 	=> 'root',
        group 	=> 'root',
				require => Package['git-core', 'vnstat'],
    }
		
		service { "${mv_theeye_probes::service_name}":
			ensure => "running",
			require => File["/etc/init.d/${mv_theeye_probes::service_name}"],
		}
		
		#exec { "mv_theeye_probes_start":
		#	command => "/usr/bin/nohup ${mv_theeye_probes::config_path}/node_modules/.bin/coffee ${mv_theeye_probes::config_path}/main.js.coffee &",
		#	unless => "/bin/ps aux | /bin/grep ${mv_theeye_probes::config_path}/main.js.coffee | /bin/grep -v 'grep'",
		#}
}
