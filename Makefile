default:	build

PYTHON	= python

build:
	$(PYTHON) setup.py build
build-py:
	$(PYTHON) setup.py build_py

.PHONY:	build

test:	build
	mkdir -p tmp-test-install
	sleep 3s
	$(PYTHON) setup.py install --skip-build --prefix tmp-test-install
	$(PYTHON) test_mGramCounts.py		;\
#	$(PYTHON) test_SparseVector.py		;\
#	$(PYTHON) test_LanguageModel.py		;\
	$(PYTHON) test_Minimization.py		;\
	$(PYTHON) test_SequenceModel.py		;\
#	$(PYTHON) test_IntTuple.py		;\
	$(PYTHON) test_sequitur.py
#	rm -r tmp-test-install

INSTALL_TARGET = $(HOME)/sr/lib-$(ARX)

install: build
	umask 022; \
	$(PYTHON) setup.py install --skip-build --home $(INSTALL_TARGET)

clean:
	rm -rf tmp-test-install
	rm -f *~
	rm -rf build dist
	rm -f *.pyc
	rm -f SparseVector.c
	rm -f sequitur_.py sequitur_wrap.cpp

# ---------------------------------------------------------------------------

TARGETS	= \
	_sequitur_.so sequitur_.py	\
	Evaluation.py  Minimization.py SequenceModel.py sequitur.py g2p.py \
	misc.py tool.py

