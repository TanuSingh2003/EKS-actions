# Use official Python image
FROM python:3.10-slim

# Set working directory inside container
WORKDIR /app

# Copy files into container
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Set the default command to run your app
CMD ["python", "python.py"]

