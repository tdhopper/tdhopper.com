SASSDIR='themes/bootstrap/static/assets/sass'
COMPILEDCSSDIR='themes/bootstrap/static/assets/_css'
S3_BUCKET='tdhopper.com'

all: clean build push
	echo "Fail"

build: public

public: scss
	hugo

scss-watch:
	nodemon --watch themes/hugo-theme-bootstrap4-blog/source/scss/ -x "npm run build"

scss:
	npm run build

preview:
	hugo server --watch --port 1313 --buildDrafts --buildFuture --quiet

clean:
	cd themes/hugo-theme-bootstrap4-blog && npm run clean
	rm -rf public

deploy: build s3_upload invalidate

s3_upload: build
	s3cmd sync --acl-public --delete-removed public/ s3://$(S3_BUCKET)

invalidate:
	python build-scripts/invalidate.py

push:
	git push

.PHONY=build s3_upload