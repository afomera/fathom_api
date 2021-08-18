module Fathom
  class AccountResource < Resource
    def info
      get_request("account")
    end
  end
end
