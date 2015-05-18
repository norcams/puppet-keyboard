#
class keyboard(
  $keymap = 'us',
) {

  case $::os[family] {
    'RedHat': {
      case $::os[release][major] {
        7: {
          shellvar { "set KEYMAP=${keymap}":
            ensure   => present,
            target   => '/etc/vconsole.conf',
            variable => 'KEYMAP',
            value    => $keymap,
          }
        }
      }
    }
    default: {
    }
  }

}

