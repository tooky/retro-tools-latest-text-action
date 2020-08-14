#!/bin/bash

text="$(retro latest)"
text="${text//'%'/'%25'}"
text="${text//$'\n'/'%0A'}"
text="${text//$'\r'/'%0D'}"
echo "::set-output name=text::${text}"
