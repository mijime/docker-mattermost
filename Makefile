MATTERMOST_VER = 3.0.2

ASSETS = assets/runtime/config.json.tmpl

all: $(ASSETS)

assets/runtime/config.json.tmpl: scripts/convert-json.awk assets/runtime/config.json.tmpl.tmp
	awk -f $^ > $@

assets/runtime/config.json.tmpl.tmp:
	curl -L https://raw.githubusercontent.com/mattermost/platform/v$(MATTERMOST_VER)/config/config.json \
		| sed -e 's/":8065"/":80"/g' -e 's/"DEBUG"/"INFO"/g' \
		> $@
