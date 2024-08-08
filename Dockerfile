# Use the official Python image from the Docker Hub
FROM pxvacrsaab.azurecr.io/base-image:10-stable

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY ./src /app

COPY requirements.txt requirements.txt

# Install the required dependencies
RUN pip install -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run the application
CMD ["flask", "run", "--host=0.0.0.0"]
