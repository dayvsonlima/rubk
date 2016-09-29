require 'core_ext'
require 'buble'

server = Buble.new 3000

server.get(/ciao/) do |response|
  <<-HTML
  <html>
    <head>
      <title>Ahoy!</title>
    </head>
    <body>
      <h1>Ciao!</h1>
      <form action='/salute' method='post'>
        <input type="text" name="name" placeholder='your name!'/>
      </form>
    </body>
  </html>
  HTML
end

server.post(/salute/) do |response|
  "Hi asdfsa#{`response.body`}"
end

server.get(/.*/) do |response|
  ["Hi asdfsa#{`response.url`}", 200]
end

server.start!
