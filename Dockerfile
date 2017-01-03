FROM phusion/baseimage:0.9.19
MAINTAINER Zhan.Shi <g.shizhan.g@gmail.com>


RUN apt-get update && apt-get install -y curl python3.5 python3.5-dev
RUN curl -kL https://bootstrap.pypa.io/get-pip.py | python3.5
RUN pip --no-cache-dir install numpy matplotlib scipy scikit-learn pandas numexpr sympy pyzmq networkx
RUN pip --no-cache-dir install ipykernel jupyter ipython[notebook]
RUN ipython3 kernel install --name python3.5
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME /notebooks
WORKDIR /notebooks

EXPOSE 8888
CMD ["/bin/sh", "-c", "/usr/local/bin/jupyter-notebook --no-browser --ip=0.0.0.0 --notebook-dir=/notebooks"]
#Contact GitHub API Training Shop Blog About
