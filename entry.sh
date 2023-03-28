#!/bin/bash

# NOT: bu betik dosyası spesifik bir projenin otomasyonu olup, anlaşılabilirlik için Türkçe olarak
# hazırlanmıştır.

# Ortam dosyasını getirme.
if [[ -f ".env" ]] ; then
    source ".env"
else
    echo -e "\uyarı: ortam dosyası bulunamadı, elle değişkenler oluşturmanız gerekebilir."
fi

# Otomatik editör seçici.
if command -v "nano" &> /dev/null && [[ -z "${EDITOR}" ]] ; then
    EDITOR="$(command -v nano)"
elif command -v "vim" &> /dev/null && [[ -z "${EDITOR}" ]] ; then
    EDITOR="$(command -v vim)"
elif command -v "vi" &> /dev/null && [[ -z "${EDITOR}" ]] ; then
    EDITOR="$(command -v vi)"
fi

export SCRIPTS="${PWD}/_scripts" EDITOR DISCORDSH WEBHOOK

while [[ "${#}" -gt 0 ]] ; do
    case "${1}" in
        "--duyuru"|"-d")
            if [[ -f "${DISCORDSH}" ]] ; then
                bash -c "${EDITOR} ${SCRIPTS}/tbvpt-duyuru.sh" && {
                    echo -e "\tbaşarı: betik kaydedildi.."
                    bash "${SCRIPTS}/tbvpt-duyuru.sh" && {
                        echo -e "\tbaşarı: betik yürütme başarı ile çalıştı."
                    } || {
                        echo -e "\thata: betik yürütme başarısız."
                    }
                } || {
                    echo -e "\thata: betik kaydedilemedi, çıkılıyor."
                    exit 1
                }
            else
                echo -e "\thata: bu özellik discord.sh dosyası gerektirmektedir, lütfen ortam değişkenlerinizi ayarlayın."
                exit 1
            fi
            shift
        ;;
        "--kural"|"-k")
            if [[ -f "${DISCORDSH}" ]] ; then
                bash -c "${EDITOR} ${SCRIPTS}/tbvpt-kural.sh" && {
                    echo -e "\tbaşarı: betik kaydedildi.."
                    bash "${SCRIPTS}/tbvpt-kural.sh" && {
                        echo -e "\tbaşarı: betik yürütme başarı ile çalıştı."
                    } || {
                        echo -e "\thata: betik yürütme başarısız."
                    }
                } || {
                    echo -e "\thata: betik kaydedilemedi, çıkılıyor."
                    exit 1
                }
            else
                echo -e "\thata: bu özellik discord.sh dosyası gerektirmektedir, lütfen ortam değişkenlerinizi ayarlayın."
                exit 1
            fi
            shift
        ;;
        "--yardım"|"-y")
            echo -e "${0##*/} betiği 3 (üç) parametreye sahip: 
\tduyuru: duyuru göndermek.
\tkural: kural göndermek.
\tyardım: bu ekran."
        shift
        ;;
        *)
            echo -e "\thata: parametre ayrıştırılamıyor, bilinmeyen özellikler için \"--yardım\" argümanını deneyin."
            shift
        ;;
    esac
done