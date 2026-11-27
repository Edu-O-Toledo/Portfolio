FROM python:3.11-slim

# Instala a biblioteca de sistema que está faltando para o rasterio/geopandas
RUN apt-get update && apt-get install -y \
    libexpat1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8501

CMD ["sh", "-c", "streamlit run portfolio_eduardo.py --server.port=${PORT:-8501} --server.address=0.0.0.0"]