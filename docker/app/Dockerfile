# pull official base image
FROM python:3.9.6-alpine

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set dns server
RUN echo "nameserver 8.8.8.8" >> /etc/resolv.conf

# modify repositories
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories


RUN pip install --upgrade pip -i https://pypi.douban.com/simple

# install packages
COPY requirements.txt .
RUN apk --no-cache add --virtual build-packages \
			build-base \
			python3-dev \
			mariadb-dev \
            libffi-dev \
		&& pip install -r requirements.txt -i https://pypi.douban.com/simple

# copy entrypoint.sh
COPY entrypoint.sh .
RUN sed -i 's/\r$//g' /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/entrypoint.sh

# copy project
COPY . .

# run entrypoint.sh
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

