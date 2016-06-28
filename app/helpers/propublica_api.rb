require 'json'
require 'open-uri'

module ProPublicaAPI

  def self.request(endpoint)
    JSON.parse(open("https://api.propublica.org#{endpoint}", "X-API-Key" => ENV["PROPUBLICA_API_KEY"]).read)
  end

  def self.votes_by_month(chamber, year, month)
    if (chamber != nil && year != nil && month != nil)
      endpoint = "/congress/v1/#{chamber}/votes/#{year}/#{month}.json"
      request(endpoint)
    end
  end

  def self.roll_call_vote(congress, chamber, session_number, roll_call_number)
    if (congress != nil && chamber != nil && session_number != nil && roll_call_number != nil)
      chamber = chamber.downcase
      endpoint = "/congress/v1/#{congress}/#{chamber}/sessions/#{session_number}/votes/#{roll_call_number}.json"
      request(endpoint)
    end
  end

  def self.bills(congress, bill_id)
    if (congress != nil && bill_id != nil)
      endpoint = "/congress/v1/#{congress}/bills/#{bill_id}/subjects.json"
      request(endpoint)
    end
  end

  def self.legislators(congress, chamber)
    if (congress != nil && chamber != nil)
      endpoint = "/congress/v1/#{congress}/#{chamber}/members.json"
      request(endpoint)
    end
  end



end

# PropublicaAPI.request("/congress/v1/114/senate/sessions/2/votes/17.json")
# PropublicaAPI.roll_call_vote()

