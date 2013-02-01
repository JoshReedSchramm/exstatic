include Exstatic::Validators

module Exstatic
  class Page < ActiveRecord::Base
    validates :slug, :nonexistant_path => true

    attr_accessible :title, :content, :slug
  end
end
