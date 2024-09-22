FROM openjdk:latest

WORKDIR /usr/src/app

COPY ./scripts/run_code.sh /usr/src/app/scripts/run_code.sh

RUN chmod +x /usr/src/app/scripts/run_code.sh

CMD ["sh", "-c", "javac Main.java && java Main"]
