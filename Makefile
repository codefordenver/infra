.PHONY: diff show
all: diff

# diff against locally deployed services
# TODO: parametize
diff:
	tk diff environments/ghost/dev

# TODO: parametize
show:
	tk show --dangerous-allow-redirect environments/ghost/dev > ./out/manifest.yaml
