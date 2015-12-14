.PHONY: all clean coverage test verbose

all:
	cd data && make data
	cd data && make unzip
	cd data && make validate
	cd code && make all
	cd code && make paperfig
	cd paper && make all

clean:
	find . -name "*.so" -o -name "*.pyc" -o -name "*.pyx.md5" -o -name "testnib.nii.gz" -o -name "temp.txt" | xargs rm -f

coverage:
	nosetests code/utils/tests data/tests --with-coverage --cover-package=data/data.py  --cover-package=code/utils/functions

test:
	nosetests code/utils/tests data/tests

verbose:
	nosetests -v code/utils/tests data/tests
