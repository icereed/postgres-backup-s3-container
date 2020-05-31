FROM alpine:3.12

ENV PGHOST='localhost'
ENV PGPORT='5432'
ENV PGDATABASE='postgres'
ENV PGUSER='postgres@postgres'
ENV PGPASSWORD='password'

RUN apk add --no-cache aws-cli postgresql-client

COPY dumpDatabase.sh .

ENTRYPOINT [ "/bin/sh" ]
CMD [ "./dumpDatabase.sh" ]