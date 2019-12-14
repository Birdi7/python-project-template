# Template for Python project

Template for python projects. Uses [poetry](http://poetry.eustace.io) for package-managing, [black](https://github.com/psf/black) and [isort](https://github.com/timothycrosley/isort) with [seed-isort-config](https://github.com/asottile/seed-isort-config) for code-formatting, and [flake8](http://flake8.pycqa.org/en/latest/) with [pylint](https://www.pylint.org) for linting. [Pre-commit](https://pre-commit.com) hooks are installed for every tool.

## Requirements

The poetry should be installed in the system. [How to?](https://python-poetry.org/docs/#installation)

## Quick usage

1. Make new directory with the following command.
   Specify name of the project with `-n=name` or `--name=name`:

```bash

bash <(curl -sL https://raw.githubusercontent.com/Birdi7/python-project-template/master/install.sh) -n=new_project
```

2. Update information about the author in [pyproject.toml](pyproject.toml#L7)

## Pre-installed packages

Can be found in [pyproject.toml](pyproject.toml#L7)


## FAQ
# How to

### use poetry? 
Read [this](https://python-poetry.org/docs/basic-usage/) and use [this](https://python-poetry.org/docs/cli/) as reference

#### activate virtual environment ?
```poetry shell```

#### add new dependency?
```https://python-poetry.org/docs/basic-usage/#installing-dependencies```
