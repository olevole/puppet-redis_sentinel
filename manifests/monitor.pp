# == Define: redis_sentinel::monitor
#
# Sets up a particular piece of the Redis Sentinel config file to 
# monitor a paritcular redis instance
#
# === Paramaters
#
# [*ensure*]
#   Present or absent. Defaults to present.
# 
# ....
# 
define redis_sentinel::monitor (
  $ensure                  => 'present',
  $address                 => '127.0.0.1',
  $port                    => '6379',
  $quorum                  => '2',
  $down_after_milliseconds => '6000',
  $failover_timeout        => '9000',
  $can_failover            => 'yes',
  $parallel_syncs          => '5',
) {

  concat::fragment { "redis_sentinel_${name}":
    ensure  => $ensure,
    target  => $redis_sentinel::config_file,
    content => template('redis_sentinel/monitor.erb'),
  }

}