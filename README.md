
Setup
----------------

`virtualenv -p python3 venv`
`source venv/bin/activate`
`pip install -r requirements.txt`
`pip install git+https://github.com/KristianOellegaard/django-hvad.git@releases/1.8.x`
`python manage.py makemigrations website`
`python manage.py migrate`
`python manage.py runserver`

django-ordered-models cannot upgrade to 2.0 due to:
https://stackoverflow.com/questions/38944378/django-from-django-urls-import-reverse-importerror-no-module-named-urls
(should be okay with Django 1.10.0)

Django cannot upgrade to 1.10.0 due to django-hvad:
https://stackoverflow.com/questions/49817489/migrating-to-django-1-11-django-hvad-error
