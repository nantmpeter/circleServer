class UsersController < ApplicationController
  @@salt = 'circleServer'

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @invite = Invite.where(:code=>params[:user][:code])
    @user = User.new(user_params)
    respond_to do |format|
      if !@invite.empty? && @user.save
        @invite = @invite.take
        circle_user = CircleUser.new(:circle_id=>@invite.circle_id,:user_id=>@user.id,:invite_user_id=>@invite.user_id)
        if circle_user.save
          num = @invite.num+1
          @invite.num = num
          @invite.code = Digest::MD5.hexdigest(@invite.user_id.to_s+@invite.circle_id.to_s+num.to_s+@@salt)
          @invite.save
        end
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        @user.errors[:base] << "邀请码错误！"
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      # check_code
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

    # def check_code
    #   code = params[:user][:code]
    #   @invite = Invite.where(:code=>code).take
    #   unless @invite
    #     raise '邀请码错误'
    #   end
    # end
end
