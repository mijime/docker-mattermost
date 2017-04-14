MATTERMOST_VER = 3.6.6

ASSETS = assets/runtime/config.json.tmpl README.md

all: $(ASSETS)

assets/runtime/config.json.tmpl: scripts/convert-json.awk assets/runtime/config.json.tmpl.tmp
	awk -f $^ > $@

assets/runtime/config.json.tmpl.tmp:
	curl -L https://raw.githubusercontent.com/mattermost/platform/v$(MATTERMOST_VER)/config/config.json \
		| sed -e 's/":8065"/":80"/g' -e 's/"DEBUG"/"INFO"/g' \
		> $@

README.md: assets/runtime/config.json.tmpl.tmp scripts/README.md
	{ cat scripts/README.md; awk -f scripts/listup-markdown.awk $<; } > $@
