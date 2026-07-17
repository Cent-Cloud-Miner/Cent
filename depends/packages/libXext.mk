package=libXext
$(package)_version=1.3.7
$(package)_download_path=http://xorg.freedesktop.org/releases/individual/lib/
$(package)_file_name=$(package)-$($(package)_version).tar.xz
$(package)_sha256_hash=6C643C7035CDACF67AFD68F25D01B90EF889D546C9FCD7C0ADF7C2CF91E3A32D
$(package)_dependencies=xproto xextproto libX11 libXau

define $(package)_set_vars
  $(package)_config_opts=--disable-static
endef

define $(package)_config_cmds
  $($(package)_autoconf)
endef

define $(package)_build_cmds
  $(MAKE)
endef

define $(package)_stage_cmds
  $(MAKE) DESTDIR=$($(package)_staging_dir) install
endef
