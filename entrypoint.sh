#!/bin/sh -l

escape_output() {
content="${1}"
content="${content//'%'/'%25'}"
content="${content//$'\n'/'%0A'}"
content="${content//$'\r'/'%0D'}"
echo $content
}

text=$(ls -l)
echo "::set-output name=text::$(escape_output "${text}")"
