default: deploy

build:
	hugo -t heather-hugo

serve:
	hugo server --buildDrafts -t heather-hugo

deploy: build
	DATE="$(shell date)"
	cd public; \
		git add -A; \
		git ci -m "rebuilding site `date`"; \
		git push origin master

