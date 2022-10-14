FROM python:3.10.8-bullseye

COPY ./app/ /opt/rapidfort/k8s_scanner
COPY ./scripts/ /opt/rapidfort/k8s_scanner

COPY requirements.txt /opt/rapidfort/requirements.txt

RUN pip install -r /opt/rapidfort/requirements.txt

WORKDIR /opt/rapidfort/k8s_scanner
ENV "PYTHONPATH"="/opt/rapidfort/k8s_scanner"

CMD bash scanner.sh
