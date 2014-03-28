class PublicAccountsController < ApplicationController
  # GET /public_accounts
  # GET /public_accounts.json
  def index
    @public_accounts = PublicAccount.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @public_accounts }
    end
  end

  # GET /public_accounts/1
  # GET /public_accounts/1.json
  def show
    @public_account = PublicAccount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @public_account }
    end
  end

  # GET /public_accounts/new
  # GET /public_accounts/new.json
  def new
    @public_account = PublicAccount.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @public_account }
    end
  end

  # GET /public_accounts/1/edit
  def edit
    @public_account = PublicAccount.find(params[:id])
  end

  # POST /public_accounts
  # POST /public_accounts.json
  def create
    @public_account = PublicAccount.new(params[:public_account])

    respond_to do |format|
      if @public_account.save
        format.html { redirect_to @public_account, notice: 'Public account was successfully created.' }
        format.json { render json: @public_account, status: :created, location: @public_account }
      else
        format.html { render action: "new" }
        format.json { render json: @public_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /public_accounts/1
  # PUT /public_accounts/1.json
  def update
    @public_account = PublicAccount.find(params[:id])

    respond_to do |format|
      if @public_account.update_attributes(params[:public_account])
        format.html { redirect_to @public_account, notice: 'Public account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @public_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /public_accounts/1
  # DELETE /public_accounts/1.json
  def destroy
    @public_account = PublicAccount.find(params[:id])
    @public_account.destroy

    respond_to do |format|
      format.html { redirect_to public_accounts_url }
      format.json { head :no_content }
    end
  end
end
