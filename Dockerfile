FROM python:3.6.7-alpine3.7
COPY . /opt/app
WORKDIR /opt/app
ENV EFB_DATA_PATH  /opt/app/ehforward_config
ENV PROFILE default
RUN apk --no-cache --virtual build add sed build-base libffi-dev openssl-dev &&\
    apk --no-cache add jpeg-dev zlib-dev libmagic ffmpeg &&\
    pip install -r requirements.txt &&\
    rm -rf ~/.cache &&\
    apk del build &&\
    sed -i "s/token123456/$TOKEN/g" /opt/app/ehforward_config/profiles/${PROFILE}/blueset.telegram/config.yaml &&\
    sed -i "s/admin123456/$ADMIN/g" /opt/app/ehforward_config/profiles/${PROFILE}/blueset.telegram/config.yaml 
VOLUME /opt/app/ehforward_config/profiles/${PROFILE}/blueset.telegram/tadata.db
ENTRYPOINT ehforwarderbot -p ${PROFILE}
