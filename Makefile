GITHUB_PAGES_REPO=https://$(GH_TOKEN)@github.com/seiffert/seiffert.github.io.git

default: deploy

clone-ghpages-repo:
	git clone $(GITHUB_PAGES_REPO) public

build: clone-ghpages-repo
	hugo -t heather-hugo

serve:
	hugo server --buildDrafts -t heather-hugo

deploy: build
	hugo -t heather-hugo
	cd public; \
		git config user.name "Travis CI"; \
		git config user.email "paul.seiffert@gmail.com"; \
		git add -A; \
		git commit -m "rebuilding site $(shell date)"; \
		git push $(GITHUB_PAGES_REPO) master
