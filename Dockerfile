FROM ubuntu

RUN sed -i 's#http://archive.ubuntu.com/#http://mirrors.tuna.tsinghua.edu.cn/#' /etc/apt/sources.list \
    && apt update -y \
    && apt install wget -y \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt install ./google-chrome-stable_current_amd64.deb -f -y\
    && mkdir /app \
    && cd /app

COPY undetected_chromedriver /app
EXPOSE 9515
CMD ["/app/undetected_chromedriver", "--allowed-ips=", "--allowed-origins=*"]

    
