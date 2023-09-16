test:
	poetry run pytest $(TEST_PATH)

lint:
	poetry run pylint $(LINT_PATH)

install_pkg:
	pip install --upgrade pip
	pip install -U pip setuptools
	pip install poetry
	poetry install

install_poetry:
	pip install --upgrade pip
	pip install -U pip setuptools
	pip install poetry

build_pkg:
	if [ ! -d ./build ] ; then mkdir ./build ; fi
	rm -rf ./build/$(SRC_PATH)
	mkdir ./build/$(SRC_PATH)
	poetry export -f requirements.txt --output ./build/$(SRC_PATH)/requirements.txt --without-hashes
	python -m pip install \
		--platform manylinux2014_x86_64 \
		--target=$(LAMBDA_NAME) \
		--implementation cp \
		--only-binary=:all: \
		--upgrade \
		-r ./build/$(SRC_PATH)/requirements.txt -t ./build/$(SRC_PATH)
	cp -r ./$(SRC_PATH) ./build/$(SRC_PATH)
	cp ./$(SRC_PATH)/lambda_function.py ./build/$(SRC_PATH)/lambda_function.py
	cd ./build/$(SRC_PATH) ; zip -r9 ../deployment_package.zip .