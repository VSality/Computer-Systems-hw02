# Используем официальный образ Python в качестве базового
FROM python:3.10

# Устанавливаем рабочую директорию в контейнере
WORKDIR /app

# Копируем requirements.txt в контейнер
COPY requirements.txt .

# Обновляем pip и устанавливаем зависимости
#RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Копируем все файлы приложения в контейнер
COPY . .

# Открываем порт 8000 для доступа к приложению
EXPOSE 8000

# Запускаем приложение
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
