class profiles::linode {
  include profiles::components::users
  User <| tag == 'tx.dc' |>
  Ssh_authorized_key <| tag == 'tx.dc' |>

  class { 'profiles::components::webserver': }
}
