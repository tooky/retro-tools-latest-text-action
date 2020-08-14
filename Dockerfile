FROM stevetooke/retro-tools:v0.1.2
COPY entrypoint.sh /entrypoint.sh
COPY github_actions_escape /github_actions_escape
RUN chmod +x /entrypoint.sh
RUN chmod +x /github_actions_escape
ENTRYPOINT [ "/entrypoint.sh" ]
