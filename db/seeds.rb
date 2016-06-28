
# require 'twitter'
# require 'rubygems'

require 'propublica_api'

# Issue.delete_all
# Politician.delete_all
# Interest.delete_all

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

Issue.create(name: "Gun Laws", keywords: ["second amendment", "gun", "guns", "firearms", "fire arms", "shooting", "shootings", "mass shootings", "gun violence", "endgunviolence", "disarmhate", "2nd amendment", "gun violence prevention laws", "nra", "gun show loophole", "gun show", "mass shootings"], image: "issue_twitter_gunlaws.png")

Issue.create(name: "Immigration", keywords: ["immigration" "immigrant", "refugee", "refugees", "deportation", "undocumented", "undocumented immigrant", "illegal immigrant", "illegals", "border", "border control", "detention center", "amnesty", "sanctuary city", "sanctuary cities"], image: "issue_twitter_immigration.png")

Issue.create(name: "LGBTQ", keywords: ["lgbtq", "lgbtq rights", "lgbt", "lesbian", "gay", "bisexual", "trans", "transgender", "queer", "gay marriage", "bathroom bill", "pride", "gay rights", "homophobia", "homosexual", "sexual orientation", "cys"], image: "issue_twitter_lgbtq.png")

Issue.create(name: "Economy", keywords: ["economy", "tax", "taxes", "raise", "minimum wage", "raise the minimum wage", "jobs", "job", "wages", "wage", "tax break", "tax breaks", "economic", "economic policy", "economic plan", "debt", "tax plan", "recession", "surplus", "spending", "trade", "economic growth", "tax code", "tax reform", "job creation", "creates jobs", "obamanomics", "regulation", "jobs report", "jobsreport", "gdp", "trickle-down", "trickle down", "working-class", "working class", "middle class", "rich", "poor", "socialist", "socialism", "recession", "Depression", "reaganomics"], image: "issue_twitter_economy.png")

Issue.create(name: "Healthcare", keywords: ["affordable care act", "obamacare", "healthcare", "health care", "aca", "obama care", "medicare", "medicaid", "affordable coverage", "affordable care", "high quality care", "high-quality care", "healthcare premium", "insurance companies", "insurance company"], image: "issue_twitter_healthcare.png")

Politician.create(name: "Diana Ozemebhoya Eromosele", political_party: "Democrat", title: "DBC Student", twitter_handle: "lecturestobeats", twitter_profile: "Software Engineer-in-training at DBC", image: 'diana.png')

Politician.create(name: "Hillary Rodham Clinton", political_party: "Democrat", title: "Presumptive Democratic Nominee for President", twitter_handle: "hillaryclinton", twitter_profile: "Wife, mom, grandma, women+kids advocate, FLOTUS, Senator, SecState, hair icon, pantsuit aficionado, 2016 presidential candidate. Tweets from Hillary signed –H", image:'hillary_clinton.png')

Politician.create(name: "Bernie Sanders", political_party: "Independent", title: "Senator, Vermont", twitter_handle: "sensanders", twitter_profile: "Join our campaign for president at http://berniesanders.com . Tweets by staff.", image: 'bernie_sanders.png')

Politician.create(name: "Elizabeth Warren", political_party: "Democrat", title: "Senator, Massachusetts", twitter_handle: "senwarren", twitter_profile: "Official twitter account of Senator Elizabeth Warren of Massachusetts.", image: 'elizabeth_warren.png')

Politician.create(name: "Donald Trump", political_party: "Republican", title: "Presumptive Republican Nominee for President", twitter_handle: "realdonaldtrump", twitter_profile: "#MakeAmericaGreatAgain #Trump2016 #Instagram: https://www.instagram.com/realdonaldtrump/ … #Facebook: https://m.facebook.com/DonaldTrump/", image: 'donald_trump.png')

Politician.create(name: "Paul Ryan", political_party: "Republican", title: "Speaker of the House", twitter_handle: "speakerryan", twitter_profile: "Office of the 54th Speaker of the House, Paul Ryan", image: 'paul_ryan.png')

Politician.create(name: "Ted Cruz", political_party: "Republican", title: "Senator, Texas", twitter_handle: "sentedcruz", twitter_profile: "Representing the State of Texas in the United States Senate.", image: 'ted_cruz.png')

Politician.all.each do |p|
  Issue.all.each do |i|
    Interest.create(politician_id: p.id, issue_id: i.id)
  end
end

votes_array = ['h-2015-01.json', 'h-2015-02.json', 'h-2015-03.json', 'h-2015-04.json', 'h-2015-05.json', 'h-2015-06.json', 'h-2015-07.json', 'h-2015-08.json', 'h-2015-09.json', 'h-2015-10.json', 'h-2015-11.json', 'h-2015-12.json', 'h-2016-01.json', 'h-2016-02.json', 'h-2016-03.json', 'h-2016-04.json', 'h-2016-05.json', 'h-2016-06.json', 's-2015-01.json', 's-2015-02.json', 's-2015-03.json', 's-2015-04.json', 's-2015-05.json', 's-2015-06.json', 's-2015-07.json', 's-2015-08.json', 's-2015-09.json', 's-2015-10.json', 's-2015-11.json', 's-2015-12.json', 's-2016-01.json', 's-2016-02.json', 's-2016-03.json', 's-2016-04.json', 's-2016-05.json', 's-2016-06.json']

votes_array.each do |bill_vote|
  file = File.read("congress-votes/#{bill_vote}")
  results = JSON.parse(file)
  votes = results['results']['votes']
  votes.each do |vote|
    print "Creating vote..."
    vote = Vote.create(
      chamber: results['results']['chamber'],
      congress: vote['congress'],
      session: vote['session'],
      roll_call: vote['roll_call'],
      official_bill_id: vote['bill_number'],
      democratic_yes: vote['democratic']['yes'],
      democratic_no: vote['democratic']['no'],
      democratic_present: vote['democratic']['present'],
      democratic_not_voting: vote['democratic']['not_voting'],
      republican_yes: vote['republican']['yes'],
      republican_no: vote['republican']['no'],
      republican_present: vote['republican']['present'],
      republican_not_voting: vote['republican']['not_voting'],
      independent_yes: vote['independent']['yes'],
      independent_no: vote['independent']['no'],
      independent_present: vote['independent']['present'],
      independent_not_voting: vote['independent']['not_voting'],
      total_yes: vote['total']['yes'],
      total_no: vote['total']['no'],
      total_present: vote['total']['no'],
      total_not_voting: vote['total']['not_voting']
      )
    puts "vote #{vote.id} for roll call #{vote.roll_call} created."
  end
end

house_legislators = ProPublicaAPI.legislators(114, 'house')
house_legislators['results'][0]['members'].map do |legislator|
  print "Creating legislator..."
  legislator = Legislator.create(
    bioguide_id: legislator['id'],
    chamber: house_legislators['results'][0]['chamber'],
    first_name: legislator['first_name'],
    last_name: legislator['last_name'],
    party: legislator['party'],
    twitter_account: legislator['twitter_account'],
    seniority: legislator['seniority'],
    next_election: legislator['next_election'],
    total_votes: legislator['total_votes'],
    missed_votes: legislator['missed_votes'],
    total_present: legislator['total_present'],
    state: legislator['state'],
    missed_votes_pct: legislator['missed_votes_pct'],
    votes_with_party_pct: legislator['votes_with_party_pct']
    )
  puts "legislator #{legislator.id}, #{legislator.first_name} #{legislator.last_name} created."
end

senate_legislators = ProPublicaAPI.legislators(114, 'senate')
senate_legislators['results'][0]['members'].map do |legislator|
  print "Creating legislator..."
  legislator = Legislator.create(
    bioguide_id: legislator['id'],
    chamber: senate_legislators['results'][0]['chamber'],
    first_name: legislator['first_name'],
    last_name: legislator['last_name'],
    party: legislator['party'],
    twitter_account: legislator['twitter_account'],
    seniority: legislator['seniority'],
    next_election: legislator['next_election'],
    total_votes: legislator['total_votes'],
    missed_votes: legislator['missed_votes'],
    total_present: legislator['total_present'],
    state: legislator['state'],
    missed_votes_pct: legislator['missed_votes_pct'],
    votes_with_party_pct: legislator['votes_with_party_pct']
    )
  puts "legislator #{legislator.id}, #{legislator.first_name} #{legislator.last_name} created."
end

bill_error_count = 0
Vote.all.each do |vote|
  bill = ProPublicaAPI.bills(vote.congress, vote.official_bill_id.downcase.gsub(/\s+/, "") )
  puts "Creating bill for vote with id of #{vote.id}..."
  puts "bill: #{bill}"

  if bill['status'] == 'ERROR'
    puts "BILL ERROR"
    bill_error_count += 1
    next
  end
  puts "bill['results']: #{bill['results']}"
  puts "bill['results'][0]: #{bill['results'][0]}"

  bill_args = {
    congress: bill['results'][0]['congress'],
    bill: bill['results'][0]['bill'],
    title: bill['results'][0]['title'],
    sponsor: bill['results'][0]['sponsor'],
    sponsor_id: bill['results'][0]['sponsor_id'],
    introduced_date: bill['results'][0]['congress'],
    cosponsors: bill['results'][0]['number_of_cosponsors'],
    committees: bill['results'][0]['committees'],
    latest_major_action_date: bill['results'][0]['latest_major_action_date'],
    latest_major_action: bill['results'][0]['latest_major_action']}

  temp_bill = Bill.new(bill_args)

  if temp_bill.valid?
    temp_bill.save
  else
    File.open("seed_error_log.txt", "a") do |file|
      file.puts "#{bill_args.to_json}"
      file.puts "Errors: #{ temp_bill.errors.full_messages.join(", ") }"
      file.puts
    end
  end

  puts "Bill with id #{temp_bill.id}, #{temp_bill.bill} #{temp_bill.title} created."

  vote.update_attributes(bill_id: temp_bill.id)

  vote_positions = ProPublicaAPI.roll_call_vote(vote.congress, vote.chamber, vote.session, vote.roll_call)
  vote_positions['results']['votes']['vote']['positions'].map do |position|
    print "Creating position..."
    position_args = {
      vote_id: vote.id,
      bioguide_id: position['member_id'],
      vote_position: position['vote_position']
      }
    temp_position = Position.new(position_args)
    if temp_position.valid?
      temp_position.save
    else
      File.open("seed_error_log.txt", "a") do |file|
        file.puts "#{position_args.to_json}"
        file.puts "Errors: #{ temp_position.errors.full_messages.join(", ") }"
        file.puts
      end
    end
    puts "position #{temp_position.id} created."
    bill['results'][0]['subjects'].each do |subject|
      temp_subject = Subject.where(name: subject['name']).first_or_create
      PositionsSubject.find_or_create_by(subject_id: temp_subject.id, position_id: temp_position.id)
    end
  end
  puts "All vote positions for vote #{vote.id} created."
end

