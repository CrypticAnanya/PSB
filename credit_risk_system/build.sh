#!/usr/bin/env bash
set -o errexit

echo "Installing dependencies..."
pip install -r requirements.txt

echo "Applying database migrations..."
python manage.py makemigrations
python manage.py migrate

echo "Populating sample data..."
python manage.py populate_sample_data

echo "Starting Django server..."
python manage.py runserver
