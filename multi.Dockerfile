# Stage 1: Build stage
FROM python:3.9-slim as builder

WORKDIR /app

# Copy requirements.txt to the container
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools wheel

# Install dependencies
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copy the application source code
COPY . .

# Stage 2: Production stage
FROM python:3.9-slim

WORKDIR /app

# Copy the installed dependencies from the previous stage
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages

# Copy the application source code from the previous stage
COPY --from=builder /app/* /app/

# Expose port 8000
EXPOSE 8000

# Run the FastAPI application using uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

