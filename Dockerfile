FROM rocker/binder:3.6.0

ARG NB_USER
ARG NB_UID

RUN pip3 install jupyterlab==1.0.9

COPY install.R ./
RUN R -f install.R

USER root
COPY in-class-exercises ${HOME}/in-class-exercises
COPY assignments ${HOME}/assignments
COPY lectures ${HOME}/lectures
COPY notes ${HOME}/notes
RUN chown -R ${NB_USER} ${HOME}

USER ${NB_USER}
