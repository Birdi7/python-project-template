# Template for Python project

Template for python projects. Uses [poetry](http://poetry.eustace.io) for package-managing, [black](https://github.com/psf/black) and [isort](https://github.com/timothycrosley/isort) with [seed-isort-config](https://github.com/asottile/seed-isort-config) for code-formatting, and [flake8](http://flake8.pycqa.org/en/latest/) with [pylint](https://www.pylint.org) for linting. [Pre-commit](https://pre-commit.com) hooks are installed for every tool.

## Quick usage

1. Make new directory with the following command.
   Specify name of the project with `-n=name` or `--name=name`:

```bash

bash <(curl -sL https://raw.githubusercontent.com/Birdi7/python-project-template/master/install.sh) -n=new_project
```

2. Update information about the author in [pyproject.toml](pyproject.toml#L7)

## Pre-installed packages

Can be found in [pyproject.toml](pyproject.toml#L7)
