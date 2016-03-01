project_dir = $(shell pwd)/
client_objects = $(shell ls client/)
client_object_targets = $(foreach o, $(client_objects), website/static/js/$(o).js)
client_object_src = $(foreach o, $(client_objects), client/$(o)/src/**)

all: server client

client: $(client_object_targets)
server: website/server.js

website/server.js: server/src/**
	cd server/ && pulp dep install
	cp server/package.json $(project_dir)website/package.json
	cd website/ && npm install
	cd server && pulp build --force -O --to $(project_dir)website/server.js
#	-jscompiler $(project_dir)website/server.js $(project_dir)website/server.js.min && mv $(project_dir)website/server.js.min $(project_dir)website/server.js

$(client_object_targets): website/static/js/%.js:client/% $(client_object_src)
	cd $< && pulp browserify --force -O --to $(project_dir)$@
#	-jscompiler $(project_dir)$@ $(project_dir)$@.min && mv $(project_dir)$@.min $(project_dir)$@

clean:
	-rm website/package.json
	-rm website/server.js
	-rm $(client_object_targets)

run: all
	node website/server.js
