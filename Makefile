##
# Improved Fine-Tuning Makefile
#
# @file
# @version 0.1

# Specify the desired Python version
PYTHON_VERSION ?= 3.11

# Virtual environment directory
VENV_DIR := venv

# Requirements file
REQUIREMENTS_FILE := requirements.txt

.PHONY: venv install activate

# Create a virtual environment
venv:
	python$(PYTHON_VERSION) -m venv $(VENV_DIR)
	@echo "Virtual environment created. Activate it using 'source $(VENV_DIR)/bin/activate'."

# Install dependencies from requirements.txt
install: venv
	$(VENV_DIR)/bin/pip install -r $(REQUIREMENTS_FILE)
	@echo "Dependencies installed from $(REQUIREMENTS_FILE) in virtual environment."

# Activate the virtual environment
activate:
	. $(VENV_DIR)/bin/activate && (\
		python src/main.py \
	)
	@echo "Activating the virtual environment. Run 'deactivate' to exit."

# Add additional targets/rules as needed

.PHONY: clean

# Clean up the virtual environment and other generated files
clean:
	rm -rf $(VENV_DIR)


# end
