# STAR 
# VERSION              2.5.2.a
# 

FROM      ubuntu:14.04.3 
MAINTAINER Kapeel Chougule

LABEL Description="This image is used for running STAR RNA seq alignemnt tool"
RUN apt-get update && apt-get install -y build-essential wget  git curl unzip zlib1g-dev\
ADD STAR_align.pl /usr/bin/ \
RUN [ "chmod", "+x", "/usr/bin/STAR_align.pl" ] \
RUN git clone https://github.com/alexdobin/STAR.git \
&& cd STAR\
&& make STAR \
&& git submodule update --init --recursive \
&& cp source/STAR /usr/bin/ 


ENTRYPOINT ["STAR_align.pl","-h"]
