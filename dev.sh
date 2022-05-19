#!/bin/bash

case $1 in
	build)
		docker run --rm -it --volume="$PWD:/srv/jekyll" --volume="$PWD/vendor/bundle:/usr/local/bundle" jekyll/jekyll:latest bundle exec jekyll build --incremental --trace
		;;
	serve)
		docker run --volume="$PWD:/srv/jekyll" --volume="$PWD/vendor/bundle:/usr/local/bundle" -p 4000:4000 -it jekyll/jekyll:latest jekyll serve --watch
		;;
	bash)
		docker run --volume="$PWD:/srv/jekyll" --volume="$PWD/vendor/bundle:/usr/local/bundle" -p 4000:4000 -it jekyll/jekyll:latest bash
		;;
esac
