require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('pry')
also_reload('lib/**/*.rb')

# get('/test') do
#   @something = "this is a variable"
#   erb(:whatever)
# end

get('/') do
  @albums = Album.all
  erb(:albums)
end

get('/albums') do
  binding.pry
  @albums = Album.all
end

get('/albums/new') do
  erb(:new_album)
end

get('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

post('/albums') do
  name = params[:album_name]
  album = Album.new(name, nil)
  album.save()
  @albums = Album.all() # Adding this line will fix the error.
  erb(:albums)
end

get('/albums/:id/edit') do
  "This will take us to a page with a form for updating an album with an ID of #{params[:id]}."
end

patch('/albums/:id') do
  "This route will update an album. We can't reach it with a URL. In a future lesson, we will use a form that specifies a PATCH action to reach this route."
end

delete('/albums/:id') do
  "This route will delete an album. We can't reach it with a URL. In a future lesson, we will use a delete button that specifies a DELETE action to reach this route."
end

get('/custom_route') do
  "We can even create custom routes, but we should only do this when needed."
end
