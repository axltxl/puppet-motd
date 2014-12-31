#puppet-issue

##Overview
[overview]

##Description
[description]

## Limitations

This module has been tested and is used primarily on Ubuntu-based systems.
Other systems are supported but cannot be guaranted.

## Development

I happily accept bug reports and pull requests via github.

 
##Requirements
* [puppetlabs/stdlib](https://github.com/puppetlabs/puppetlabs-stdlib)

##Example usage
```puppet
include motd
```
```puppet
#
motd::file {'my_motd': 
	source => 'puppet://files/my_motd.sh'
}

#
motd::file {'another_motd': 
	source => 'puppet://files/another_motd.sh'
	priority => 50
}
```

###Parameters
####`[source]`
Path to the file to be inserted/updated as the `issue` file

