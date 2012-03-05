class CrunoCardsController < ApplicationController
  # GET /cruno_cards
  # GET /cruno_cards.json
  def index
    @cruno_cards = CrunoCard.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cruno_cards }
    end
  end

  # GET /cruno_cards/1
  # GET /cruno_cards/1.json
  def show
    @cruno_card = CrunoCard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cruno_card }
    end
  end

  # GET /cruno_cards/new
  # GET /cruno_cards/new.json
  def new
    @cruno_card = CrunoCard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cruno_card }
    end
  end

  # GET /cruno_cards/1/edit
  def edit
    @cruno_card = CrunoCard.find(params[:id])
  end

  # POST /cruno_cards
  # POST /cruno_cards.json
  def create
    @cruno_card = CrunoCard.new(params[:cruno_card])

    respond_to do |format|
      if @cruno_card.save
        format.html { redirect_to @cruno_card, notice: 'Cruno card was successfully created.' }
        format.json { render json: @cruno_card, status: :created, location: @cruno_card }
      else
        format.html { render action: "new" }
        format.json { render json: @cruno_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cruno_cards/1
  # PUT /cruno_cards/1.json
  def update
    @cruno_card = CrunoCard.find(params[:id])
    @cruno_card.player = Player.find(2)

    respond_to do |format|
      if @cruno_card.update_attributes(params[:cruno_card])
        format.html { redirect_to @cruno_card, notice: 'Cruno card was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @cruno_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cruno_cards/1
  # DELETE /cruno_cards/1.json
  def destroy
    @cruno_card = CrunoCard.find(params[:id])
    @cruno_card.destroy

    respond_to do |format|
      format.html { redirect_to cruno_cards_url }
      format.json { head :ok }
    end
  end
  
  # PUT /cruno_cards/dealspecific/1
  # PUT /cruno_cards/dealspecific/1.json
  def dealspecific
    @cruno_card = CrunoCard.find(params[:id])
    @player = Player.find(1)
    puts "Found player #{@player.name}"
    puts "--------------"
    puts "Player inspect: #{@player.inspect}"
    puts "--------------"
    puts "Cruno card inspect: #{@cruno_card.inspect}"
    puts "--------------"
    
    @player.cruno_cards << @cruno_card
    
    puts "Players cards updated to #{@player.cruno_cards.inspect}"
    puts "--------------"
    
    respond_to do |format|
      if @player.save
        format.html { redirect_to @cruno_card, notice: "Cruno card #{@cruno_card.color} #{@cruno_card.value} dealt to #{@player.name}." }
        format.json { render json: @cruno_card, status: :created, location: @cruno_card }
        
        @player_reloaded = Player.find(1)

        puts "After the save, Players cards reloaded as #{@player_reloaded.cruno_cards.inspect}"
        puts "--------------"
        @card_reloaded = CrunoCard.find(params[:id])
        puts "After the save, Card reloaded as #{@card_reloaded.inspect}"
      else
        format.html { render action: "edit" }
        format.json { render json: @cruno_card.errors, status: :unprocessable_entity }
      end
    end
  end
end
