get '/' do
  @notes = Note.all
  erb :index
end

post '/new' do
  new_note = Note.new(title: params[:title], content: params[:content])
  new_note.save
  redirect "/"
end


post '/edit/:id' do
  @note_to_edit = Note.find_by_id(params[:id])
  erb :edit
end


post '/delete/:id' do
  @note_to_delete = Note.destroy(params[:id])
  redirect '/'
end

post '/update/:id' do
  @note_to_update = Note.find_by_id(params[:id])
  @note_to_update.title = "#{params[:title]}"
  @note_to_update.content = "#{params[:content]}"
  if @note_to_update.save
    redirect '/'
  else
  	erb :edit
  end
end