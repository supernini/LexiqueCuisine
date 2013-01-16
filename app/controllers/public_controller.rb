class PublicController < ApplicationController
  def index
    @lexique = Lexique.order("home_view ASC, RAND()").first
    if @lexique
      @lexique.update_attributes(:home_view => @lexique.home_view+1)
    end
  end

  def alpha
    @letters = ('A'..'Z').to_a
    @lexiques = Lexique.order(:first_letter).all.group_by{|u| u.first_letter}
  end
end
