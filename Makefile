MATTERMOST_VER = 3.9.0
MATTERMOST_EDITION = team

ASSETS = assets/runtime/config.json.tmpl README.md Dockerfile

all: $(ASSETS)

Dockerfile: scripts/Dockerfile.template
	sed \
		-e 's/##MATTERMOST_VER##/$(MATTERMOST_VER)/g' \
		-e 's/##MATTERMOST_EDITION##/$(MATTERMOST_EDITION)/g' \
		> $@ < $^

assets/runtime/config.json.tmpl: scripts/convert-json.awk assets/runtime/config.json.tmpl.tmp
	awk -f $^ > $@

assets/runtime/config.json.tmpl.tmp:
	curl -L https://raw.githubusercontent.com/mattermost/platform/v$(MATTERMOST_VER)/config/default.json \
		| sed -e 's/:8065/:80/g' -e 's/"DEBUG"/"INFO"/g' \
		> $@

build: scripts/build-editions.sh Dockerfile
	@bash scripts/build-editions.sh $(MATTERMOST_VER)

README.md: assets/runtime/config.json.tmpl.tmp scripts/README.md
	{ cat scripts/README.md; awk -f scripts/listup-markdown.awk $<; } > $@

update-tags: scripts/update-tags.sh
	@bash scripts/update-tags.sh --version $(MATTERMOST_VER)

update-latest-tags: scripts/update-tags.sh
	@bash scripts/update-tags.sh --version $(MATTERMOST_VER) --latest
