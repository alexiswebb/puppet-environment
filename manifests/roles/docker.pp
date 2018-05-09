class profiles::roles::docker (
  $options = {},
) {
  class { 'docker':
    * => $options,
  }
  class { 'docker::compose':
    ensure  => present,
    version => '1.18.0',
  }
}
