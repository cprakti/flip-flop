# require 'twitter'
# require 'rubygems'

Issue.delete_all
Politician.delete_all
Interest.delete_all


#   client = Twitter::REST::Client.new do |config|
#   config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
#   config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
#   config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
#   config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
#   end

# def client.get_all_tweets(politician)
#   options = {:count => 250, :include_rts => true}
#   user_timeline(politician, options)
# end

# hillary_tweets = client.get_all_tweets("hillaryclinton")
# diana_tweets = client.get_all_tweets("lecturestobeats")
# bernie_sanders_tweets = client.get_all_tweets("sensanders")
# elizabeth_warren_tweets = client.get_all_tweets("senwarren")
# donald_trump_tweets = client.get_all_tweets("realdonaldtrump")
# paul_ryan_tweets = client.get_all_tweets("speakerryan")
# ted_cruz_tweets = client.get_all_tweets("sentedcruz")



Issue.create(name: "Gun Laws", keywords: ["second amendment", "gun", "guns", "firearms", "fire arms", "shooting", "shootings", "mass shootings", "gun violence", "endgunviolence", "disarmhate", "2nd amendment", "gun violence prevention laws", "nra", "gun show loophole", "gun show", "mass shootings"])
Issue.create(name: "Immigration", keywords: ["immigration" "immigrant", "refugee", "refugees", "deportation", "undocumented", "undocumented immigrant", "illegal immigrant", "illegals", "border", "border control", "detention center", "amnesty", "sanctuary city", "sanctuary cities"]  )
Issue.create(name: "LGBTQ", keywords: ["lgbtq", "lgbtq rights", "lgbt", "lesbian", "gay", "bisexual", "trans", "transgender", "queer", "gay marriage", "bathroom bill", "pride", "gay rights", "homophobia", "homosexual", "sexual orientation", "cys"] )
Issue.create(name: "Economy", keywords: ["economy", "tax", "taxes", "raise", "minimum wage", "raise the minimum wage", "jobs", "job", "wages", "wage", "tax break", "tax breaks", "economic", "economic policy", "economic plan", "debt", "tax plan", "recession", "surplus", "spending", "trade", "economic growth", "tax code", "tax reform", "job creation", "creates jobs", "obamanomics", "regulation", "jobs report", "jobsreport", "gdp", "trickle-down", "trickle down", "working-class", "working class", "middle class", "rich", "poor", "socialist", "socialism", "recession", "Depression", "reaganomics"] )
Issue.create(name: "Healthcare", keywords: ["affordable care act", "obamacare", "healthcare", "health care", "aca", "obama care", "medicare", "medicaid", "affordable coverage", "affordable care", "high quality care", "high-quality care", "healthcare premium", "insurance companies", "insurance company"] )



Politician.create(name: "Diana Ozemebhoya Eromosele", political_party: "Democrat", title: "DBC Student", twitter_handle: "lecturestobeats", twitter_profile: "Software Engineer-in-training at DBC", image: File.open(File.join(Rails.root, '/app/assets/images/diana.jpg')), tweets: diana_tweets)

Politician.create(name: "Hillary Rodham Clinton", political_party: "Democrat", title: "Presumptive Democratic Nominee for President", twitter_handle: "hillaryclinton", twitter_profile: "Wife, mom, grandma, women+kids advocate, FLOTUS, Senator, SecState, hair icon, pantsuit aficionado, 2016 presidential candidate. Tweets from Hillary signed –H", image: File.open(File.join(Rails.root, '/app/assets/images/hillary_clinton.jpg')), tweets: hillary_tweets )


Politician.create(name: "Bernie Sanders", political_party: "Independent", title: "Senator, Vermont", twitter_handle: "sensanders", twitter_profile: "Join our campaign for president at http://berniesanders.com . Tweets by staff.", image: File.open(File.join(Rails.root, '/app/assets/images/bernie_sanders.jpg')), tweets: bernie_sanders_tweets )


Politician.create(name: "Elizabeth Warren", political_party: "Democrat", title: "Senator, Massachusetts", twitter_handle: "senwarren", twitter_profile: "Official twitter account of Senator Elizabeth Warren of Massachusetts.", image: File.open(File.join(Rails.root, '/app/assets/images/elizabeth_warren.jpg')), tweets: elizabeth_warren_tweets )



Politician.create(name: "Donald Trump", political_party: "Republican", title: "Presumptive Republican Nominee for President", twitter_handle: "realdonaldtrump", twitter_profile: "#MakeAmericaGreatAgain #Trump2016 #Instagram: https://www.instagram.com/realdonaldtrump/ … #Facebook: https://m.facebook.com/DonaldTrump/", image: File.open(File.join(Rails.root, '/app/assets/images/donald_trump.jpg')), tweets: donald_trump_tweets )


Politician.create(name: "Paul Ryan", political_party: "Republican", title: "Speaker of the House", twitter_handle: "speakerryan", twitter_profile: "Office of the 54th Speaker of the House, Paul Ryan", image: File.open(File.join(Rails.root, '/app/assets/images/paul_ryan.jpg')), tweets: paul_ryan_tweets )


Politician.create(name: "Ted Cruz", political_party: "Republican", title: "Senator, Texas", twitter_handle: "sentedcruz", twitter_profile: "Representing the State of Texas in the United States Senate.", image: File.open(File.join(Rails.root, '/app/assets/images/ted_cruz.jpg')), tweets: ted_cruz_tweets )


Interest.create(politician_id: 1, issue_id: 1)
Interest.create(politician_id: 2, issue_id: 1)
Interest.create(politician_id: 3, issue_id: 1)
Interest.create(politician_id: 4, issue_id: 1)
Interest.create(politician_id: 5, issue_id: 1)
Interest.create(politician_id: 6, issue_id: 1)
Interest.create(politician_id: 7, issue_id: 1)


Interest.create(politician_id: 1, issue_id: 2)
Interest.create(politician_id: 2, issue_id: 2)
Interest.create(politician_id: 3, issue_id: 2)
Interest.create(politician_id: 4, issue_id: 2)
Interest.create(politician_id: 5, issue_id: 2)
Interest.create(politician_id: 6, issue_id: 2)
Interest.create(politician_id: 7, issue_id: 2)


Interest.create(politician_id: 1, issue_id: 3)
Interest.create(politician_id: 2, issue_id: 3)
Interest.create(politician_id: 3, issue_id: 3)
Interest.create(politician_id: 4, issue_id: 3)
Interest.create(politician_id: 5, issue_id: 3)
Interest.create(politician_id: 6, issue_id: 3)
Interest.create(politician_id: 7, issue_id: 3)


Interest.create(politician_id: 1, issue_id: 4)
Interest.create(politician_id: 2, issue_id: 4)
Interest.create(politician_id: 3, issue_id: 4)
Interest.create(politician_id: 4, issue_id: 4)
Interest.create(politician_id: 5, issue_id: 4)
Interest.create(politician_id: 6, issue_id: 4)
Interest.create(politician_id: 7, issue_id: 4)


Interest.create(politician_id: 1, issue_id: 5)
Interest.create(politician_id: 2, issue_id: 5)
Interest.create(politician_id: 3, issue_id: 5)
Interest.create(politician_id: 4, issue_id: 5)
Interest.create(politician_id: 5, issue_id: 5)
Interest.create(politician_id: 6, issue_id: 5)
Interest.create(politician_id: 7, issue_id: 5)



