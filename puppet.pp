notify { 'welcome':
	message => "Welcome to the Abyss"
}

file { 'motd':
	path    => '/var/run/motd',
	ensure  => present,
	mode    => 0644,
	content => "Welcome to the abyss.
This machine is puppet controlled for your safety.
Please do not step outside of the cart.
",
}

file { 'xsessions':
	path	=> '/usr/share/xsessions/default.desktop',
	ensure	=> present,
	mode	=> 644,
	source  => '/home/adamm/code/Dotfiles/xsessions/default.desktop',
}

################################################################################
# Adam's Dotfiles.
################################################################################

# This whole section is very badly done, but at least it's done.
file { 'bin':
	path	=> '/home/adamm/bin',
	ensure	=> link,
	mode	=> 700,
	target	=> '/home/adamm/code/Dotfiles/bin/',
}

file { 'bashrc':
	path	=> '/home/adamm/.bashrc',
	ensure	=> link,
	mode	=> 600,
	target	=> '/home/adamm/code/Dotfiles/home/.bashrc',
}

file { 'gitkrc-2.0':
	path	=> '/home/adamm/.gitkrc-2.0',
	ensure	=> link,
	mode	=> 600,
	target	=> '/home/adamm/code/Dotfiles/home/.gitkrc-2.0',
}

file { 'icons':
	path	=> '/home/adamm/.icons',
	ensure	=> link,
	mode	=> 700,
	target	=> '/home/adamm/code/Dotfiles/home/.icons',
}

file { 'vimrc':
	path	=> '/home/adamm/.vimrc',
	ensure	=> link,
	mode	=> 600,
	target	=> '/home/adamm/code/Dotfiles/home/.vimrc',
}

file { 'xsession':
	path	=> '/home/adamm/.xsession',
	ensure	=> link,
	mode	=> 600,
	target	=> '/home/adamm/code/Dotfiles/home/.xsession',
}

################################################################################

exec { "aptgetupdate":
	command => "/usr/bin/apt-get update",
	#refreshonly => true;
}

package {
	'synapse':
	ensure => latest,
	require => Exec["aptgetupdate"];

	'eclipse':
	ensure => latest,
	require => Exec["aptgetupdate"];

	'sysvbanner':
	ensure => latest,
	require => Exec["aptgetupdate"];

	'sl':
	ensure => latest,
	require => Exec["aptgetupdate"];

	'feh':
	ensure => latest,
	require => Exec["aptgetupdate"];
}
