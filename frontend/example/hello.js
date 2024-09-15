window.addEventListener('load', async () => {
  try {
    await Scheme.load_main('hello.wasm', {
      reflect_wasm_dir: '.',
      user_imports: {
        document: {
          body() {
            return document.body
          },
          createTextNode: Document.prototype.createTextNode.bind(document)
        },
        element: {
          appendChild(parent, child) {
            return parent.appendChild(child)
          }
        },
        websocket: {
          make(address) {
            console.log('Connecting to websocket...')
            return new WebSocket(address)
          },
          onMessage(ws, callback) {
            ws.addEventListener('message', callback)
          },
          onOpen(ws, callback) {
            ws.addEventListener('open', callback)
          },
          eventData(event) {
            return event.data
          },
          send(ws, message) {
            ws.send(message)
          }
        }
      }
    })
  } catch (e) {
    if (e instanceof WebAssembly.CompileError) {
      document.getElementById('wasm-error').hidden = false
    }
  }
})
