FROM python:3.12

RUN mkdir -p /uni

WORKDIR /uni

EXPOSE 8000

COPY requirements.txt .

RUN pip3 install -r requirements.txt --no-cache-dir

RUN pip3 install psycopg2-binary gunicorn uvicorn

COPY manage.py .

COPY django_gh_actions/ django_gh_actions/

COPY university/ university/

CMD ["gunicorn", "--bind", ":8000", "-k", "uvicorn.workers.UvicornWorker", "django_gh_actions.asgi"]