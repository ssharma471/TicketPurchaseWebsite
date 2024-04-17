# Use the official Python 3 image as a base
FROM python:3

# Set environment variable to ensure Python output is sent straight to terminal without buffering it first
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the Pipfile and Pipfile.lock from your local machine to the container's working directory
COPY Pipfile Pipfile.lock /app/

# Install pipenv
RUN pip install pipenv

# Install dependencies using pipenv
RUN pipenv install --deploy --ignore-pipfile

# Copy all the files from your local machine to the container's working directory
COPY . /app/

# Expose port 8000 to the outside world
EXPOSE 80

# Run the Django development server
CMD ["pipenv", "run", "python", "manage.py", "runserver", "0.0.0.0:80"]
