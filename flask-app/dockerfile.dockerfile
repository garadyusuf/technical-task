# Use the official Python image as a base image
FROM python:3.9-slim

# Copy the current directory contents into the container
COPY . /

# Install dependencies
RUN pip install Flask pytz

# Expose the Flask application port
EXPOSE 8080

# Run the Flask application
CMD ["python", "sampleapp.py"]
