class profiles::machines::work::tao (){
  include profiles::roles::development
  include profiles::roles::wifi
  include profiles::roles::ansible
  include profiles::roles::nextcloud_client
  include profiles::roles::apps::slack
  include profiles::roles::apps::vscode
  include profiles::roles::development::hub

  include profiles::roles::apps
  include profiles::roles::apps::light
  include profiles::roles::yubikey
  include profiles::roles::vagrant
  include profiles::roles::i3
  include profiles::roles::linux::thinkpad
  include profiles::roles::docker

  apt::ppa { 'ppa:ubuntu-elisp/ppa': }

  class { 'hashicorp::terraform':
    version => '0.11.14',
  }

  package { [
    'cmus',
    'emacs25',
  ]:
    ensure  => present,
    require => Apt::Ppa['ppa:ubuntu-elisp/ppa'],
  }

  package { 'neovim':
  }

  package { ['python3-venv']:
  }
}
