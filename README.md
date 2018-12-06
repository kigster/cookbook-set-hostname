[![Build Status](https://travis-ci.org/kigster/cookbook-set-hostname.svg?branch=master)](https://travis-ci.org/kigster/cookbook-set-hostname)

# Set Hostname

This simple cookbook sets the hostname on a given host using the `node.name` as the default name, and appending any domain, if provided, for the fully qualified domain name of the host.

It also populates the file `/etc/hosts` and `/etc/hostname` files.

> NOTE: this cookbook works well with [DnsMadeEasy](https://github.com/kigster/dnsmadeeasy-cookbook) cookbook, that can automatically register the new hostname with DnsMadeEasy.com.

## Attributes

You can set the following attributes:

```ruby
node.normal['set-hostname']['domain'] = 'bar.com'
```

The following attributes are inferred automaticaly, but can also be overridden by the user:

```ruby
default['set-hostname']['hosts-file'] = '/etc/hosts'
default['set-hostname']['name'] = node.name
default['set-hostname']['ip'] = node['ipaddress']
```

For a node with the name `foo001`, the above configuration will result in the hostname set to `foo.bar.com` and the IP address in the `/etc/hosts` file will be `1.2.3.4`. 

### Default Attributes

The cookbook only requires that you set the domain portion of the name. 

In that case, the actual hostname portion is inferred from the `node.name`, and the IP address is taken from `node['ipaddress']` unless provided specifically by the  `node['set-hostname']['ip]` attribute.

If you do not provide the domain name, the host is configured without the FQDN.

### Contributing

To contribute, please [fork](https://github.com/kigster/cookbook-set-hostname/fork) the cookbook and submit a pull request.

## License

MIT License, full text is in the [LICENSE.md](LICENSE.md) file.

## Authors

 * Konstantin Gredeskoul (current maintainer)
 * Eric Saxby
