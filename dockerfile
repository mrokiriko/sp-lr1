FROM debian
COPY calchash.sh .
RUN chmod +x calchash.sh
CMD ./calchash.sh

