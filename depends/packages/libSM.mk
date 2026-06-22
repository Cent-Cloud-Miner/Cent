package=libSM
$(package)_version=1.2.6
$(package)_download_path=http://xorg.freedesktop.org/releases/individual/lib/
$(package)_file_name=$(package)-$($(package)_version).tar.xz
$(package)_sha256_hash=BE7C0ABDB15CBFD29AC62573C1C82E877F9D4047AD15321E7EA97D1E43D835BE
$(package)_dependencies=xtrans xproto libICE

define $(package)_set_vars
  $(package)_config_opts=--without-libuuid  --without-xsltproc  --disable-docs --disable-static
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
