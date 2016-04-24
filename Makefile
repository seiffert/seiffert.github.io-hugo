default: deploy

build:
	hugo -t heather-hugo

serve:
	hugo server --buildDrafts -t heather-hugo

deploy: build
	DATE="$(shell date)"
	cd public; \
		git add -A; \
		git ci -m "rebuilding site $(DATE)"; \
		git push origin master
	git add public
	git ci -m "Deployed at $(DATE)"
	git push origin master

