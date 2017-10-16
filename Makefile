RANGER_DIR=$(if $(XDG_CONFIG_HOME),$(XDG_CONFIG_HOME),$(HOME)/.config)/ranger
PLUGIN_DIR=$(RANGER_DIR)/plugins
RC_FILE=$(RANGER_DIR)/rc.conf
DEVICONS_IN_RC="default_linemode ranger_icons"

install:
	install -d $(PLUGIN_DIR)
	install -b ranger_icons.py $(RANGER_DIR)/ranger_icons.py
	install -b ranger_icons_linemode.py $(PLUGIN_DIR)/ranger_icons_linemode.py
	grep -q $(DEVICONS_IN_RC) $(RC_FILE) || echo $(DEVICONS_IN_RC) >> $(RC_FILE)

uninstall:
	$(RM) $(RANGER_DIR)/ranger_icons.py
	$(RM) $(PLUGIN_DIR)/ranger_icons_linemode.py
