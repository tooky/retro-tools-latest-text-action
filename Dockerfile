FROM stevetooke/retro-tools:v0.1.0
ENV PATH /usr/local/bin/retro-tools:$PATH
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
