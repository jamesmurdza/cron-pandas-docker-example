# Readme

This is an example of an app that runs a Python script at a regular interval using a Dockerfile. It comes with a working pandas library.

Contents:
- Dockerfile: Based off `amancevice/pandas`, this Dockerfile copies the necessary files, installs cron, and schedules the cronjob.
- app.py: Hello, world. Put your Python script here.
- requirements.txt: Empty file. Generate using `pip freeze > requirements.txt`