DOTFILES_SRC := $(filter %.symlink, $(shell find $(PWD) -name "*.symlink" ! -path "*/.git/*"))
DOTFILES_DST := $(addprefix $(HOME)/, $(notdir $(basename $(DOTFILES_SRC))))
DOTFILES := $(notdir $(basename $(DOTFILES_SRC)))
BACKUPS := $(addsuffix .bak, $(DOTFILES_DST))

.DEFAULT: install
.PHONY: install
install: $(DOTFILES_DST)

.PHONY: backups
backups: $(BACKUPS)

$(HOME)/%.bak:: $(HOME)/%
	cp -R $< $@

$(HOME)/%: $(PWD)/*/%.symlink
	ln -s $< $@

clean:
	rm -rf $(DOTFILES_DST)

debug:
	@echo "Backups: ${BACKUPS}"
	@echo "Dotfiles: $(DOTFILES)"
	@echo "Source: $(DOTFILES_SRC)"
	@echo "Destination: $(DOTFILES_DST)"
