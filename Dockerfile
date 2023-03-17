FROM amancevice/pandas:1.4.4

WORKDIR /app

# Copy the Python application.
COPY requirements.txt .
COPY app.py .

# Install all dependencies for the Python application.
RUN pip install -r requirements.txt

# Setup cron and a cronjob to call the Python application.
# To customize the schedule, modify the *s below using crontab-generator.org.
RUN echo "* * * * * /usr/local/bin/python /app/app.py >> /app/logs/cron.log 2>&1" > mycron
RUN apt-get update
RUN apt-get install -y cron
RUN crontab mycron

# When the container runs, start cron and print logs.
RUN mkdir logs
CMD cron && tail -f --retry -s 10 logs/cron.log
