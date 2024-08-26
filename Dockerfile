# Use the official Python image from the Docker Hub
FROM python:3.8

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

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