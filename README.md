This repository is to document my foray into puppet. For new users this
is probably an example of doing things 'the wrong way' and no
experienced user will find value in it. I did this because I want to
become more familiar with puppet options, roles, profiles and hiera.

My configuration uses several modules from https://forge.puppet.com.
There is a file named 'additionalModules.txt' that has a list of each
module I have installed from the Puppet Forge (as well as the command
used to install it).

The 'demo' directory is from '/etc/puppetlabs/code/environment/demo' and
my demo clients are configured to use the 'demo' environment.

To push changes quickly, I configure clients to poll the puppet server
every five minutes with the 'runinterval' option. By default this value
is measured in seconds, to set it in minutes the value is specified
as <x>m, where <x> is the number of minutes (example below).

=========================

Sample puppet.conf for clients/agents:

[agent]
environment = demo
runinterval = 5m

=========================

On my to-do list:
  o add a beats module for filebeat/winlogbeat/metricbeat/packetbeat
  o separate ingest/enrich profiles for logstash nodes
  o make more use of hiera without relying heavily on create_resources
  o add a proper user-management class
  o refactor the common_services class to break those classes out
    into their own modules (or see if what exists fits my needs
    without adding too much complexity)
  o puppetdb. I don't have a need for it but it looks like an interesting
    approach to storing facts/catalogues and for per-node reports

There are also several puppet/puppetlabs modules I would like to test:
  o puppetlabs/aws
  o puppetlabs/azure
  o puppetlabs/firewall
  o puppetlabs/powershell
  o puppet/splunk
  o puppet/windows_firewall

So...things may get interesting.
