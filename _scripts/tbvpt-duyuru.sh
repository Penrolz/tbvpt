#!/bin/bash

TEXT="Merhaba bu deneme duyurusu."

bash "${DISCORDSH}" \
  	--webhook-url="${WEBHOOK}" \
	--text		"${TEXT}" \
	--username 	"TBvPT Duyuru" \
	--avatar 	"https://cdn.discordapp.com/icons/708309577971662978/5e4f7771c46172d6851111b653d3c47a.png" \
	--timestamp

