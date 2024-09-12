#!/bin/bash
URL="https://api.telegram.org/bot6591155974:AAFBaAlpkvMI2LKkVHS-M65IZ_RgjokqNp8/sendMessage"
TEXT="Deploy status: $1%0A%0AProject:+$CI_PROJECT_NAME%0AStatus:+$CI_JOB_STATUS%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG"

curl -s -d "chat_id=449774516&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null