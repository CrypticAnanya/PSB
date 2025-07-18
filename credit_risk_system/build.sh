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
# Open browser in background
# xdg-open http://127.0.0.1:8000/ &  # for Linux
start http://127.0.0.1:8000/     # for Windows (uncomment if using Windows)

python manage.py runserver
