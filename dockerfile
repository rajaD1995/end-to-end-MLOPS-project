FROM python:3.10-slim

# creating a directory "app" in docker image
WORKDIR /app

# copy evrything inside flask_app and paste inside docker's app folder
COPY flask_app/ /app/

# from local folder models/vectorizer.pkl is copied and pasted inside /app/models/
COPY models/vectorizer.pkl /app/models/vectorizer.pkl

# The requirements.txt inside flask_app is being installed
RUN pip install -r requirements.txt

# extra things required for this project, downloaded
RUN python -m nltk.downloader stopwords wordnet

# expose it in 5001 local port
EXPOSE 5001

#local
CMD ["python", "app.py"]  

#Prod
# CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--timeout", "120", "app:app"]