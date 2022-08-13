FROM python:3.10.6-slim
MAINTAINER hung.pham.pth@gmail.com

RUN apt update

RUN pip install torch torchvision jupyter notebook

RUN jupyter notebook --generate-config

RUN echo "c.NotebookApp.password = u'argon2:\$argon2id\$v=19\$m=10240,t=10,p=8\$18e83WNIFsSlJKKP/XdVRw\$6JE1f4qjNIULX7hRgJZ3JJDHc6cZvpkEZZauTxlb3BA'" \
    >> /root/.jupyter/jupyter_notebook_config.py

COPY sessions /sessions/
COPY README.md /sessions/README.md

WORKDIR /sessions/

ENTRYPOINT jupyter notebook --ip 0.0.0.0 --no-browser --allow-root
