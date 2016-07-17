class BotsController < ApplicationController
  @@limit_tweet = 30

  def index
  end

  def confucius
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["YOUR_CONSUMER_KEY"]
      config.consumer_secret     = ENV["YOUR_CONSUMER_SECRET"]
      config.access_token        = ENV["YOUR_ACCESS_TOKEN"]
      config.access_token_secret = ENV["YOUR_ACCESS_SECRET"]
    end
    #nouns = "I You He She It They We Sarah Susan Andy James Donald Nat David Gabriel Jennifer_Anniston Bradley_Cooper Batman Super_Man Captain_America"
    verbs = "runs walks sleeps jumps sits stands thinks fights flees dives swims kicks stabs shoots types programs tweets facebooks text"
    articles = "a at the to from with towards back "
    adjective = "nice mean stupid skinny fat smart sweet sleepy blonde freckled pink cold hot round bloated fast slow lazy hazy humid sleak flashy shiny red yellow black dirty filthy slutty sour moldy rancid"
    object = "fence stairs bottle knife gun motorcycle flower house suit laptop gem soda wizard unicorn butterflies rainbows car urn iPad iPhone Coke coffee steak "
    adverbs = "quickly slowly cunningly thoroughly indiscriminantly magically quietly secretly violently peacefully eerily completely sporadically steathily complacently lovingly hastily "

    # r_nouns = nouns.split[Random.rand(nouns.split.length)]
    r_verbs = verbs.split[Random.rand(verbs.split.length)]
    r_articles = articles.split[Random.rand(articles.split.length)]
    r_adjective = adjective.split[Random.rand(adjective.split.length)]
    r_object = object.split[Random.rand(object.split.length)]
    r_adverbs = adverbs.split[Random.rand(adverbs.split.length)]

    @@limit_tweet -= 1
    if @@limit_tweet < 0
      @random = nil
    else
      @random = "You should " + r_adverbs + " " + r_verbs+ " " + r_articles + " " + r_adjective + " " + r_object + "."
    end
    render 'index'
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
    def bot_params
      params.require(:bot).permit(:question)
    end
end
