# frozen_string_literal: true

class DecksController < ApplicationController
  before_action :set_deck, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  # GET /decks
  # GET /decks.json
  def index
    @user = current_user
    @decks = Deck.all
  end

  # GET /decks/1
  # GET /decks/1.json
  def show
    @user = current_user
    @deck = Deck.find(params[:id])
    @query = params[:query]
  end

  def add_card
    authenticate!
    deck = Deck.find(params[:id])
    copies = deck.cards.where(id: params[:card])
    allcards = deck.cards
    if copies.length < 2 && allcards.length < 30
      deck.cards.push(Card.find(params[:card]))
    end
    redirect_to "/decks/#{deck.id}"
 end

  def delete_card
    authenticate!
    deck = Deck.find(params[:id])
    card = Card.find(params[:card])
    thecard = IncludeCard.find_by(card_id: params[:card], deck_id: params[:id])
    thecard.delete

    redirect_to "/decks/#{deck.id}"
  end

  # GET /decks/new
  def new
    @deck = current_user.decks.build
  end

  # GET /decks/1/edit
  def edit
    @user = current_user
    @deck = Deck.find(params[:id])
    @cards = Card.all
  end

  # POST /decks
  # POST /decks.json
  def create
    @deck = current_user.decks.create(deck_params)
    @user = current_user
    current_user.decks.push(@deck)

    respond_to do |format|
      if @deck.save
        format.html { redirect_to @deck, notice: 'Deck was successfully created.' }
        format.json { render :show, status: :created, location: @deck }
      else
        format.html { render :new }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decks/1
  # PATCH/PUT /decks/1.json
  def update
    deck = Deck.find(params[:id])
    deck.update!(deck_params)
    # todo make redirect
  end

  # DELETE /decks/1
  # DELETE /decks/1.json
  def destroy
    @deck.destroy
    respond_to do |format|
      format.html { redirect_to decks_url, notice: 'Deck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deck
    @deck = Deck.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def deck_params
    params.require(:deck).permit(:name)
  end
end
