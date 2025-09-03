# `MAKEFILES_DIR` __MUST__ be defined in the root Makefile
include $(MAKEFILES_DIR)/base.mk


PIP_MODE ?= uv


ifeq ($(PIP_MODE),uv)
PIP = python -m uv pip
PIP_COMPILE = python -m uv pip compile
PIP_SYNC = python -m uv pip sync
else ifeq ($(PIP_MODE),pip)
PIP = python -m pip
PIP_COMPILE = pip-compile
PIP_SYNC = pip-sync
else
$(error Invalid PIP_MODE='$(PIP_MODE)', must be 'uv' (default) or 'pip')
endif


.PHONY: pip
pip:
ifeq ($(PIP_MODE),uv)
	$(call INFO,Installing/Updating uv)
	@python -m pip install --upgrade uv
endif


.PHONY: pip-tools
pip-tools: | pip
	@$(PIP) install --upgrade pip-tools


%.txt: %.in | pip-tools
	$(call INFO,Compiling $*.txt)
ifeq ($(PIP_MODE),uv)
	@$(PIP_COMPILE) \
		--custom-compile-command "make update" \
		--upgrade \
		$< -o $@
else ifeq ($(PIP_MODE),pip)
	@CUSTOM_COMPILE_COMMAND="make update" \
	$(PIP_COMPILE) \
		--verbose --upgrade --strip-extras --no-emit-index-url --no-emit-trusted-host \
		--resolver=backtracking \
		$<
endif


.PHONY: requirements
requirements: requirements.in # Compile requirements (pip-compile).
	@touch requirements.in
	@$(MAKE) requirements.txt


.PHONY: sync
sync: requirements.txt | pip-tools # Sync dependencies (pip-sync).
	$(call INFO,Syncing dependencies)
	@$(PIP_SYNC) requirements.txt


.PHONY: update
update: requirements sync # Compile requirements & sync dependencies.


.PHONY: install
install: requirements.txt | pip # Install dependencies (pip).
	$(call INFO,Installing dependencies)
	$(PIP) install -r requirements.txt
