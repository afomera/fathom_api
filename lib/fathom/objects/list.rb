module Fathom
  class List < Object
    def initialize(attributes)
      super
      @attributes["data"].map! do |entry|
        Fathom.build_object(entry)
      end
    end

    def has_more?
      @attributes["has_more"]
    end

    def next_page
      @attributes["data"].last.id
    end

    def prev_page
      @attributes["data"].first.id
    end
  end
end
