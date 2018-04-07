class profiles::machines::linodes::calico {
  require profiles::machines::linode

  include profiles::roles::docker
  include profiles::roles::sudoers
  include profiles::roles::docker::znc
  include profiles::roles::docker::ttrss

  include profiles::roles::nginx

  nginx::resource::server { ['mastodon-test.calico.demophoon.com']:
    proxy => 'https://localhost:3000',
  }

  class { 'profiles::roles::backup':
    backup_dirs => [
      '/home/',
      '/opt/',
    ],
  }
}
