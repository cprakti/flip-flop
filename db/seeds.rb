Issue.delete_all
Politician.delete_all
PoliticianIssue.delete_all

["Gun Control", "Immigration", "Healthcare", "Social Justice", "Economy"].each do |word|
Issue.create(name: word)
end

Politician.create(name: "Hillary Rodhamn Clinton", political_party: "Democrat", title: "Presumptive Democratic Nominee for President", twitter_handle: "hillaryclinton"  )
Politician.create(name: "Donald Trump", political_party: "Republican", title: "Presumptive Republican Nominee for President", twitter_handle: "realdonaldtrump"   )
Politician.create(name: "Paul Ryan", political_party: "Republican", title: "Speaker of the House", twitter_handle: "speakerryan"   )
Politician.create(name: "Bernie Sanders", political_party: "Independent", title: "Senator, Vermont", twitter_handle: "sensanders" )
Politician.create(name: "Elizabeth Warren", political_party: "Democrat", title: "Senator, Massachusetts", twitter_handle: "senwarren"   )
Politician.create(name: "Barack Obama", political_party: "Democrat", title: "President", twitter_handle: "barackobama"   )

PoliticianIssue.create(politician_id: 1, issue_id: 1)
PoliticianIssue.create(politician_id: 2, issue_id: 1)
PoliticianIssue.create(politician_id: 3, issue_id: 1)
PoliticianIssue.create(politician_id: 4, issue_id: 1)
PoliticianIssue.create(politician_id: 5, issue_id: 1)
PoliticianIssue.create(politician_id: 6, issue_id: 1)

PoliticianIssue.create(politician_id: 1, issue_id: 2)
PoliticianIssue.create(politician_id: 2, issue_id: 2)
PoliticianIssue.create(politician_id: 3, issue_id: 2)
PoliticianIssue.create(politician_id: 4, issue_id: 2)
PoliticianIssue.create(politician_id: 5, issue_id: 2)
PoliticianIssue.create(politician_id: 6, issue_id: 2)

PoliticianIssue.create(politician_id: 1, issue_id: 3)
PoliticianIssue.create(politician_id: 2, issue_id: 3)
PoliticianIssue.create(politician_id: 3, issue_id: 3)
PoliticianIssue.create(politician_id: 4, issue_id: 3)
PoliticianIssue.create(politician_id: 5, issue_id: 3)
PoliticianIssue.create(politician_id: 6, issue_id: 3)

PoliticianIssue.create(politician_id: 1, issue_id: 4)
PoliticianIssue.create(politician_id: 2, issue_id: 4)
PoliticianIssue.create(politician_id: 3, issue_id: 4)
PoliticianIssue.create(politician_id: 4, issue_id: 4)
PoliticianIssue.create(politician_id: 5, issue_id: 4)
PoliticianIssue.create(politician_id: 6, issue_id: 4)

PoliticianIssue.create(politician_id: 1, issue_id: 5)
PoliticianIssue.create(politician_id: 2, issue_id: 5)
PoliticianIssue.create(politician_id: 3, issue_id: 5)
PoliticianIssue.create(politician_id: 4, issue_id: 5)
PoliticianIssue.create(politician_id: 5, issue_id: 5)
PoliticianIssue.create(politician_id: 6, issue_id: 5)


