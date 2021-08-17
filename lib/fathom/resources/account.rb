module Fathom
  class AccountResource < Resource
    def info
      Account.new get_request("account").body
    end
  end
end
