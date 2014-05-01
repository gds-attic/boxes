Veewee::Session.declare({
  :boot_cmd_sequence => [
    '<Esc><Esc><Enter>',
    '/install/vmlinuz noapic preseed/url=http://%IP%:%PORT%/preseed.cfg ',
    'debian-installer=en_US auto locale=en_US kbd-chooser/method=us ',
    'hostname=dev.gov.uk ',
    'fb=false debconf/frontend=noninteractive ',
    'keyboard-configuration/modelcode=SKIP keyboard-configuration/layout=USA keyboard-configuration/variant=USA console-setup/ask_detect=false ',
    'initrd=/install/initrd.gz -- <Enter>'
  ],
  :boot_wait            => '10',
  :cpu_count            => '1',
  :disk_format          => 'VDI',
  :disk_size            => '102400',
  :hostiocache          => 'off',
  :iso_download_timeout => '60',
  :iso_file             => 'ubuntu-12.04.4-server-amd64.iso',
  :iso_md5              => 'af5f788aee1b32c4b2634734309cc9e9',
  :iso_src              => 'http://releases.ubuntu.com/12.04/ubuntu-12.04.4-server-amd64.iso',
  :kickstart_file       => 'preseed.cfg',
  :kickstart_port       => '7122',
  :kickstart_timeout    => '60',
  :memory_size          => '384',
  :os_type_id           => 'Ubuntu_64',
  :postinstall_files    => [ 'postinstall.sh' ],
  :postinstall_timeout  => '10000',
  :shutdown_cmd         => 'shutdown -P now',
  :ssh_guest_port       => '22',
  :ssh_host_port        => '7222',
  :ssh_key              => '',
  :ssh_login_timeout    => '10000',
  :ssh_password         => 'vagrant',
  :ssh_user             => 'vagrant',
  :sudo_cmd             => "echo '%p'|sudo -S sh '%f'",
})
