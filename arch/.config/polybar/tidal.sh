TIDAL_HOST="http://localhost:47836"

function httpGet() {
    curl -s "$TIDAL_HOST/current"
}

JSON=$(httpGet current)

INFO=$(echo "$(echo "$JSON" | jq -r ".artist") - $(echo "$JSON" | jq -r ".title")")

STATUS=$(echo "$JSON" | jq -r ".status")

if [[ "$STATUS" == "paused" || ${#INFO} -le 3 ]]; then
    echo ""
else
    if [[ ${#INFO} -ge 65 ]]; then
        INFO=$(echo "${INFO:0:61} ...")
    fi

    echo "$INFO"
fi
