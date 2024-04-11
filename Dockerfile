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
RUN echo "Hello, let's start with the first point, I'll print it on the console."
RUN echo "Last Usage of RTFM and LMGTFY..."
RUN echo "used RTFM: last nigth ... I had to look up how to use pytest, I hadn't used it in months and honestly didn't remember how."
RUN echo "used LMGTFY:  last nigth... I didn't know how to explain Continuous Integration, so I used pseudocode due to lack of time "
RUN echo "OS. Windows 10..."
RUN echo "mastered: Python, JavaScript"

RUN echo "In the file CL.py you'll find the solution for the second point"

RUN echo "¡¡¡¡USE the terminal to run pytest and view the tests for points 4 and 5.!!!!"

RUN echo "¡¡¡¡I left you the message on Hangouts.!!!!"

RUN echo "¡¡¡¡In the file scraper_simit.py, you'll find my web scraping code that I developed for my last job. I can explain it to you during the interview.!!!!"


# Exponemos el puerto 80 para la aplicación FastAPI
EXPOSE 80
RUN echo "¡¡¡¡I also leave the uvicorn with FastAPI running so you can test the API if you want.!!!!"
# Ejecutamos la aplicación FastAPI al iniciar el contenedor
CMD ["uvicorn", "code_1:app", "--host", "0.0.0.0", "--port", "80"]
