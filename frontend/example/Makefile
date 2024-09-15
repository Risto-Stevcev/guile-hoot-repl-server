modules = \
	repl/websocket.scm \
	repl/geiser.scm \
	my-library.scm

hello.wasm: hello.scm $(modules)
	guild compile-wasm -L . -o $@ $<

clean:
	rm -f hello.wasm

serve: hello.wasm
	guile -c '((@ (hoot web-server) serve))'
