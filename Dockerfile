# Usa imagem oficial Python
FROM python:3.11-slim

# Define o diretório de trabalho no container
WORKDIR /app

# Copia os arquivos do projeto
COPY . .

# Instala dependências do sistema e Python
RUN apt-get update && apt-get install -y \
    libpq-dev gcc && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# Expõe a porta padrão do Django
EXPOSE 8000

# Comando para rodar o servidor
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
