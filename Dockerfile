FROM xgorn/python-phantomjs:3.9

# Copy coding files to workdir
COPY . /app/
WORKDIR /app/

ENV PYTHONUNBUFFERED=1

# Copy requirements.txt to root
COPY requirements.txt .

# Install dependencies
RUN pip3 install --no-cache-dir -r requirements.txt
RUN apt-get update
RUN apt-get install -y ffmpeg

# Copy the start.sh script
COPY start.sh /app/

# Make start.sh executable
RUN chmod +x /app/start.sh

# Use bash to run start.sh
CMD ["bash","start.sh"]
