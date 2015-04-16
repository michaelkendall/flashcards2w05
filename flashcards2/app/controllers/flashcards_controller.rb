class CardsController < ApplicationController
class Deck < ApplicationController

  def index
    @Decks = Deck.order("name ASC")
    erb :index
  end

  def show
    @deck = Deck.find( params[:deck_id] )
    @cards = @deck.cards.order(id: :asc)
    erb :show_deck

  end


  def play
    @deck = Deck.find(params[:deck_id])
  @card = Card.find(params[:card_id])

  cards = @deck.cards.order(id: :asc)
  card_index = cards.index(@card)

  @next_card = cards[card_index + 1]
  erb :view_card_back
end

  def new

    @decks = deck.new

  end

  def create_deck
    @deck = Deck.new ( deck_params)
     if @deck.save
    redirect_to @deck #redirects to the questions show page
  else
    render :new
    end
  end

  def create_card
    @deck = Deck.find(params[:deck_id])
  erb :new_card
end


  def edit
    @deck = Deck.find( params[:id])
    @deck.update(params[:deck])
    redirect_to @deck
  end



  private #this makes sure that any methods defined under this can only be accessed under the private method
  def deck_params
    params.require(:deck).permit(:title, :text) #require returns the questions array. of all the things being posted we only want to look at questions and only allow title and body.


  end
end
