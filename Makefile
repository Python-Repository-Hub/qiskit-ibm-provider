# This code is part of Qiskit.
#
# (C) Copyright IBM 2021.
#
# This code is licensed under the Apache License, Version 2.0. You may
# obtain a copy of this license in the LICENSE.txt file in the root directory
# of this source tree or at http://www.apache.org/licenses/LICENSE-2.0.
#
# Any modifications or derivative works of this code must retain this
# copyright notice, and modified files need to carry a notice indicating
# that they have been altered from the originals.


.PHONY: lint style test mypy test1 test2 test3 runtime_integration

lint:
	pylint -rn qiskit_ibm_provider test
	tools/verify_headers.py qiskit_ibm_provider test

mypy:
	mypy --module qiskit_ibm_provider --package test

style:
	black --check qiskit_ibm_provider test setup.py docs/tutorials

unit-test:
	python -m unittest discover --verbose --top-level-directory . --start-directory test/unit

unit-test-coverage:
	coverage run -m unittest discover --verbose --top-level-directory . --start-directory test/unit
	coverage lcov

integration-test:
	python -m unittest discover --verbose --top-level-directory . --start-directory test/integration

e2e-test:
	python -m unittest discover --verbose --top-level-directory . --start-directory test/e2e

black:
	black qiskit_ibm_provider test setup.py docs/tutorials