class RobotWorldApp < Sinatra::Base
  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = RobotInventory.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    RobotInventory.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = RobotInventory.find(id.to_i)
    erb :show
  end

  get '/robots/:id/edit' do |id|
    @robot = RobotInventory.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
    RobotInventory.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    RobotInventory.delete(id.to_i)
    redirect '/robots'
  end
end
