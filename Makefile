.PHONY: diff
all: diff

# diff against deployed services
# TODO: parametize
diff:
	tk diff environments/ghost/dev
