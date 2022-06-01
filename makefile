PROJ=django_project

$(PROJ): venv
	test $(PROJ) && touch $(PROJ)
	./venv/bin/django-admin startproject $(PROJ)

$(PROJ)/blog: $(PROJ) venv
	cd django_project ; ../venv/bin/python3 manage.py startapp blog

venv:
	python3 -m venv venv
	./venv/bin/pip3 install --upgrade pip
	./venv/bin/pip3 install django

.PHONY: clean
clean:
	rm -rf venv

.PHONY: migrations
migrations: $(PROJ) venv
	cd django_project ; ../venv/bin/python3 manage.py makemigrations
	cd django_project ; ../venv/bin/python3 manage.py migrate

