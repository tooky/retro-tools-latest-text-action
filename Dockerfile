FROM stevetooke/retro-tools:v0.1.2
COPY entrypoint.sh /entrypoint.sh
COPY script /script
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
