package=libICE
$(package)_version=1.1.2
$(package)_download_path=http://xorg.freedesktop.org/releases/individual/lib/
$(package)_file_name=$(package)-$($(package)_version).tar.xz
$(package)_sha256_hash=974E4ED414225EB3C716985DF9709F4DA8D22A67A2890066BC6DFC89AD298625
$(package)_dependencies=xtrans xproto

define $(package)_set_vars
  $(package)_config_opts=--disable-static --disable-docs --disable-specs --without-xsltproc
  $(package)_config_opts_linux=--with-pic
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
