#!/bin/bash

text="$(retro latest | ./github_actions_escape)"
echo "::set-output name=text::${text}"
