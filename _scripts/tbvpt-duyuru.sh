#!/bin/bash

TEXT="Değerli dostlarımız topluluğumuzun blog sayfası ve aynı zamanda tanıtım sitesi artık hazır, burada sizlerin mlp ile ilgili yorumlarınızı, **fikirlerinizi**, **düşüncelerinizi**, **içeriklerinizi**, **paylaşımlarınızı**, teorilerinizi ve daha nicelerini paylaşamayı hedefliyoruz, sitemiz şu anlık yapım aşamasında olduğundan fikir ve önerilerinize muhtacız:\nhttps://lazypwny751.github.io/tbvpt"

bash "${DISCORDSH}" \
  	--webhook-url="${WEBHOOK}" \
	--text		"${TEXT}" \
	--username 	"TBvPT Duyuru" \
	--avatar 	"https://cdn.discordapp.com/icons/708309577971662978/5e4f7771c46172d6851111b653d3c47a.png" \
	--timestamp

