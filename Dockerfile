# Use a base image appropriate for your programming language
FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy the source code into the container
COPY . .

# Install dependencies
RUN pip install -r requirements.txt

# Run linting
#RUN uvicorn code_1:app --reload  #run server

RUN echo "Construyendo la imagen Docker..."
RUN echo "Espero mi trabajo y experiencia sirva de aporte para Falabella."
RUN echo "Gracias por su tiempo y la oportunidad"


# Ejecutamos la aplicación FastAPI al iniciar el contenedor
CMD ["python", "falabella_test.py"]
