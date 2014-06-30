# class Users::RegistrationsController < Devise::RegistrationsController
#   before_filter :authenticate_user!
#   DEFAULT_BRACKET = '{ teams : [["Brazil",  "Chili" ],["Columbia",  "Uruguay" ],["France",  "Nigeria" ],["Germany",  "Algeria" ],["Netherlands",  "Mexico"],["Costa Rica", "Greece"],["Argentina", "Switzerland"],["Belgium", "USA"]],results :[[0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]],[[0,0], [0,0], [0,0], [0,0]],[[0,0], [0,0]],[[0,0]]], [ [[0,0], [0,0], [0,0], [0,0]],[[0,0], [0,0], [0,0], [0,0]],[[0,0], [0,0]],[[0,0], [0,0]],[[0,0]],[[0,0]][[0,0], [0,0]],[[0,0]]]]}'

#   def show
# 	@user = User.find(params[:id])
# 	render 'users/show.html.erb'
#   end

# end

class Users::RegistrationsController < ApplicationController
  before_filter :authenticate_user!
  DEFAULT_BRACKET = '{"teams":[["Brazil","Chile"],["Columbia","Uruguay"],["France","Nigeria"],["Germany","Algeria"],["Netherlands","Mexico"],["CostaRica","Greece"],["Argentina","Switzerland"],["Belgium","USA"]],"results":[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]}'

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to('/403.html')
    else
      if !@user.bracket
      	@user.bracket = DEFAULT_BRACKET
      	@user.save
      end
      @bracket = @user.bracket.to_json.html_safe
      render 'users/show.html.erb'
    end
  end

  def save_bracket
    @user = current_user
    json_info = params['registration'].to_json
    @user.bracket = json_info
    @user.save
    render nothing: true
  end

end