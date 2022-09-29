FROM python:3.10

ENV PYTHONBUFFERED=1

ARG WORKDIR=/wd
ARG USER=user

WORKDIR ${WORKDIR}

RUN useradd --system ${USER} && \
    chown --recursive ${USER} ${WORKDIR}

RUN apt update && apt upgrade -y

COPY --chown=${USER} requirements.txt requirements.txt

RUN pip install --upgrade pip && \
    pip install --requirement requirements.txt

COPY --chown=${USER} show_message.py show_message.py
COPY --chown=${USER} ./app app

USER ${USER}

ENTRYPOINT ["python", "show_message.py"]
