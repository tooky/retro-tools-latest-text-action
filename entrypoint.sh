#!/bin/bash

cd $GITHUB_WORKSPACE
text="$(retro latest | script/github_actions_escape)"
echo "::set-output name=text::${text}"
