get '/' do
  @notes = Note.all
  erb :index
end

get '/editable_notes/:id' do
  @note_to_edit = Note.find_by_id(params[:id])
  erb :edit
end


post '/notes' do
  new_note = Note.new(title: params[:title], content: params[:content])
  new_note.save
  redirect "/"
end


put '/notes/:id' do
  @note_to_update = Note.find_by_id(params[:id])
  @note_to_update.title = "#{params[:title]}"
  @note_to_update.content = "#{params[:content]}"
  if @note_to_update.save
    redirect '/'
  else
  	erb :edit
  end
end


delete '/notes/:id' do
  @note_to_delete = Note.destroy(params[:id])
  redirect '/'
end