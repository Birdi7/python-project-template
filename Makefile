# Originally wrote by @JrooTJunior in
# https://github.com/aiogram/aiogram/blob/dev-3.x/Makefile

.DEFAULT_GOAL := help

base_python := python3
py := poetry run
python := $(py) python
project_source_dir := src #todo: change it!

reports_dir := reports

.PHONY: help
help:
	@echo "======================================================================================="
	@echo "                                  build tools                                  "
	@echo "======================================================================================="
	@echo "Environment:"
	@echo "    help: Show this message"
	@echo "    install: Install development dependencies"
	@echo "    clean: Delete temporary files"
	@echo ""
	@echo "Code quality:"
	@echo "    isort: Run isort tool"
	@echo "    black: Run black tool"
	@echo "    flake8: Run flake8 tool"
	@echo "    flake8-report: Run flake8 with HTML reporting"
	@echo "    mypy: Run mypy tool"
	@echo "    mypy-report: Run mypy tool with HTML reporting"
	@echo "    lint: Run isort, black, flake8 and mypy tools"
	@echo ""
	@echo "Tests:"
	@echo "    test: Run tests"
	@echo "    test-coverage: Run tests with HTML reporting (results + coverage)"
	@echo "    test-coverage-report: Open coverage report in default system web browser"
	@echo ""
	@echo "Documentation:"
	@echo "	   docs: Build docs"
	@echo "	   docs-serve: Serve docs for local development"
	@echo "    docs-prepare-reports: Move all HTML reports to docs dir"
	@echo ""
	@echo "Project"
	@echo "    build: Run tests build package and docs"
	@echo ""



# =================================================================================================
# Environment
# =================================================================================================

.PHONY: install
install:
	$(base_python) -m pip install --user -U poetry
	poetry install

.PHONY: clean
clean:
	rm -rf `find . -name __pycache__`
	rm -f `find . -type f -name '*.py[co]' `
	rm -f `find . -type f -name '*~' `
	rm -f `find . -type f -name '.*~' `
	rm -rf `find . -name .pytest_cache`
	rm -rf *.egg-info
	rm -f .coverage
	rm -f report.html
	rm -f .coverage.*
	rm -rf {build,dist,site,.cache,.mypy_cache,reports}


# =================================================================================================
# Code quality
# =================================================================================================

.PHONY: isort
isort:
	$(py) isort -rc $(project_source_dir)

.PHONY: black
black:
	$(py) black $(project_source_dir)

.PHONY: flake8
flake8:
	$(py) flake8 $(project_source_dir)

.PHONY: flake8-report
flake8-report:
	mkdir -p $(reports_dir)/flake8
	$(py) flake8 --format=html --htmldir=$(reports_dir)/flake8 $(project_source_dir)

.PHONY: mypy
mypy:
	$(py) mypy $(project_source_dir)

.PHONY: mypy-report
mypy-report:
	$(py) mypy $(project_source_dir) --html-report $(reports_dir)/typechecking

.PHONY: lint
lint: isort black flake8 mypy

# =================================================================================================
# Tests
# =================================================================================================

.PHONY: test
test:
	$(py) pytest --cov=$(project_source_dir) --cov-config .coveragerc tests/

.PHONY: test-coverage
test-coverage:
	mkdir -p $(reports_dir)/tests/
	$(py) pytest --cov=$(project_source_dir) --cov-config .coveragerc --html=$(reports_dir)/tests/index.html tests/


.PHONY: test-coverage-report
test-coverage-report:
	$(py) coverage html -d $(reports_dir)/coverage

.PHONY: test-coverage-view
test-coverage-view:
	$(py) coverage html -d $(reports_dir)/coverage
	python -c "import webbrowser; webbrowser.open('file://$(shell pwd)/reports/coverage/index.html')"

# =================================================================================================
# Docs
# =================================================================================================

.PHONY: docs
docs:
	$(py) mkdocs build

.PHONY: docs-serve
docs-serve:
	$(py) mkdocs serve

.PHONY: docs-copy-reports
docs-copy-reports:
	mv $(reports_dir)/* site/reports

# =================================================================================================
# Project
# =================================================================================================

.PHONY: build
build: clean flake8-report mypy-report test-coverage docs docs-copy-reports
	mkdir -p site/simple
	poetry build
	mv dist site/simple/$(project_source_dir)


.PHONY: bump
bump:
	poetry version $(args)
	$(python) scripts/bump_versions.py
