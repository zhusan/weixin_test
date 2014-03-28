class DiymenusController < ApplicationController
  # GET /diymenus
  # GET /diymenus.json
  def index
    @diymenus = Diymenu.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @diymenus }
    end
  end

  # GET /diymenus/1
  # GET /diymenus/1.json
  def show
    @diymenu = Diymenu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @diymenu }
    end
  end

  # GET /diymenus/new
  # GET /diymenus/new.json
  def new
    @diymenu = Diymenu.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @diymenu }
    end
  end

  # GET /diymenus/1/edit
  def edit
    @diymenu = Diymenu.find(params[:id])
  end

  # POST /diymenus
  # POST /diymenus.json
  def create
    @diymenu = Diymenu.new(params[:diymenu])

    respond_to do |format|
      if @diymenu.save
        format.html { redirect_to @diymenu, notice: 'Diymenu was successfully created.' }
        format.json { render json: @diymenu, status: :created, location: @diymenu }
      else
        format.html { render action: "new" }
        format.json { render json: @diymenu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /diymenus/1
  # PUT /diymenus/1.json
  def update
    @diymenu = Diymenu.find(params[:id])

    respond_to do |format|
      if @diymenu.update_attributes(params[:diymenu])
        format.html { redirect_to @diymenu, notice: 'Diymenu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @diymenu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diymenus/1
  # DELETE /diymenus/1.json
  def destroy
    @diymenu = Diymenu.find(params[:id])
    @diymenu.destroy

    respond_to do |format|
      format.html { redirect_to diymenus_url }
      format.json { head :no_content }
    end
  end


  def generate_menu
    @current_public_account = PublicAccount.first
    weixin_client = WeixinAuthorize::Client.new("wx60e869fd9df2573a", "7385f2babf293fd30c8faf70e034924b")
    menu   = @current_public_account.build_menu
    result = weixin_client.create_menu(menu)
    # set_error_message(result["errmsg"]) if result["errcode"] != 0
    # redirect_to public_account_diymenus_path(@current_public_account)
  end
end
