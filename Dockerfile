# Use the official Python image from the Docker Hub
FROM python:3.7-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION 'python'

# Set the working directory in the container
WORKDIR /app

# Create the directory for Stackify logs
RUN mkdir -p /usr/local/stackify/stackify-python-apm/log/
RUN chmod -R 755 /usr/local/stackify/stackify-python-apm/log/


# Copy the requirements file into the container at /app
COPY requirements.txt /app/


# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Expose port 8000 for the Django application
EXPOSE 8000

# Command to run the Django application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "djecommerce.wsgi:application"]