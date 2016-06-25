require 'twitter'

$client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "FItvkTJndpOawAnm6RtrxYVT7"
    config.consumer_secret     = "Y0neV0epRp2AEtjyK4z3k6R397PeLyypnxuuXLc4jEF1pInvEw"
    config.access_token        = "281426689-n5SEh2TFZPAMnxlD76nmRkGBxHtgaDQVm95CphGa"
    config.access_token_secret = "2pHmgkR0UIBR4EwdRQLidy511fvnL3qcgxtGHtHq807Gl"
    end

# Twitter.configure do |config|
# config.consumer_key        = "FItvkTJndpOawAnm6RtrxYVT7"
#     config.consumer_secret     = "Y0neV0epRp2AEtjyK4z3k6R397PeLyypnxuuXLc4jEF1pInvEw"
#     config.access_token        = "281426689-n5SEh2TFZPAMnxlD76nmRkGBxHtgaDQVm95CphGa"
#     config.access_token_secret = "2pHmgkR0UIBR4EwdRQLidy511fvnL3qcgxtGHtHq807Gl"
# end

# Twitter.configure do |config|
#   config.consumer_key = 'your_consumer_key_here'
#   config.consumer_secret = 'your_consumer_secret_here'
#   config.oauth_token = 'your_oauth_token_here'
#   config.oauth_token_secret = 'your_oauth_token_secret_here'
# end

