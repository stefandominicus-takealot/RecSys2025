MAKEFILES_DIR = makefiles


include $(MAKEFILES_DIR)/help.mk
include $(MAKEFILES_DIR)/py-pip-tools.mk


# TFX doesn't support newer Python versions yet.
# See https://pypi.org/project/tfx/
# Keep Python version in sync with Dockerfile
PYTHON_VERSION = 3.10.17
include $(MAKEFILES_DIR)/py-env.mk
