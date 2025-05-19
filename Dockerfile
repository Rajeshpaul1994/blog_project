# Use official Python image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY . .

# Expose port
EXPOSE 5000

# Run the app using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "run:app"]
