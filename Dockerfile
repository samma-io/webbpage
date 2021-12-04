FROM golang


RUN mkdir /root/src
WORKDIR /root/src
RUN git clone https://github.com/gohugoio/hugo.git
WORKDIR /root/src/hugo
RUN go install --tags extended
WORKDIR /src/story
CMD hugo server --bind 0.0.0.0
