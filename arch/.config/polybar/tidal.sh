TIDAL_HOST="http://localhost:47836"

function httpGet() {
    curl -s "$TIDAL_HOST/current"
}

JSON=$(httpGet current)

TITLE=$(echo "$JSON" | jq -r ".title")
ARTISTS=$(echo "$JSON" | jq -r ".artist")

STATUS=$(echo "$JSON" | jq -r ".status")
DATE=$(date +"%F")

INFO=$(echo "$ARTISTS - $TITLE")

if [[ "$STATUS" == "paused" || ${#INFO} -le 3 ]]; then
    echo $DATE
else
    echo "$INFO | $DATE"
fi
