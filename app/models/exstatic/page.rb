module Exstatic
  class Page < ActiveRecord::Base
    attr_accessible :title, :content, :slug
  end
end
