require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'
require 'pry'

enable :sessions

helpers do
    def current_user
        User.find_by(id: session[:user])
    end
end

# before '/tasks'do
#     if current_user.nil?
#         redirect'/'
#     end
# end

get '/'do
    
    @wakeupTimes =WakeupTime.where({user_id: session[:user]})
    
    # if current_user.nil?
    #     @Wakeuptimes = WakeupTime.none
    # else
    #     @Wakeuptimes = curent_user.WakeupTime
        
    # end
    
    erb :sign_in
    
end


get '/back'do
    erb :index
end
 
get '/signin' do
    erb :sign_in
end

get '/signup' do
    erb :sign_up
end

post '/signin' do
    user = User.find_by(mail:params[:mail])
    if user && user.authenticate(params[:password])
        session[:user] = user.id
        erb :index
    else
        erb :sign_in
    end
end

post '/signup'do
    @user =User.create(mail:params[:mail], password:params[:password],user_name:params[:user_name],
    password_confirmation:params[:password_confirmation])
    if @user.persisted?
        session[:user] = @user.id
    end
    erb :index
end
        
get '/signout' do
    session[:user] = nil
    redirect '/'
end

get '/addrecord' do
    erb :add_record
end
 
 get '/food_unused' do
      erb :food_unused
      
end
get '/food_meal' do
    erb :food_meal
end

# 食べ残し
post '/food_meal_post' do
    
    case params[:date]
    
    when "月曜日" then
        params[:date]=0
    when "火曜日" then
        params[:date]=1
    when "水曜日" then
        params[:date]=2
    when "木曜日" then
        params[:date]=3
    when "金曜日" then
        params[:date]=4
    when "土曜日" then
        params[:date]=5
    when "日曜日" then
        params[:date]=6
    end
   
    food = Food.find_by(date: params[:date])
    food.food_name = params[:food_name],
    food.amount = params[:amount].to_i
    food.save
    @foods = Food.all.sort_by{|food| food.date}
    
    erb :graph 
end

# 未使用
post '/food_unused_post' do
    case params[:date]
    
    when "月曜日" then
        params[:date]=0
    when "火曜日" then
        params[:date]=1
    when "水曜日" then
        params[:date]=2
    when "木曜日" then
        params[:date]=3
    when "金曜日" then
        params[:date]=4
    when "土曜日" then
        params[:date]=5
    when "日曜日" then
        params[:date]=6
    end
   
    food = Food.find_by(date: params[:date])
    food.food_name = params[:food_name],
    food.quantity = params[:quantity],
    food.amount = params[:amount].to_i
    food.save
    
    @foods = Food.all.sort_by{|food| food.date}
    
    erb :graph 
end
    
    
    
# erb: graph