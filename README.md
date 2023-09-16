# Project Name

---
## Github Actions

---

#### Enviroment variables
- ``LAMBDA_NAME``: It should be used when the action build your project to specifie the AWS Lambda name
- ``TEST``: It can be "true" or "false", when set as a "true" value test will be triggered
- ``TEST_PATH``: This will be passed as a pararameter when have Pytest call
- ``LINT``: It can be "true" or "false", when set as a "true" value lint will be triggered
- ``LINT_PATH``: This will be passed as a pararameter when have Pylint call 
- ``DEPLOY``: It can be "true" or "false", when set as a "true" value the deploy action will be triggered
  
#### Secrets
This are the secrets that aws cli uses to deploy your code
- ``AWS_ACCESS_KEY_ID``
- ``AWS_SECRET_ACCESS_KEY``
- ``AWS_DEFAULT_REGION``

#### Jobs
- ``test``
- ``lint``
- ``deploy``

---
## Makefile
This tool are used by Github Actions and can be used to debug or change some aspect into your CI/CD pipeline. Please do not change any rule name listed here! If that event happen, you need to change some make calls into Github Action configuration.

---
#### Tools
- ``test``: Run Pytest
- ``lint``: Run Pylint

#### Install
- ``install_pkg``: Intall everything, including Poetry and all dependencies from your project
- ``install_poetry``: Install only Poetry

#### Build
- ``build_pkg``: Build your package to deploy into AWS Lambda, this action will zip your code and the dependencies in one file.