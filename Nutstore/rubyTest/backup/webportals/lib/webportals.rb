require "webportals/engine"
require "webportals/version"

require "formtastic"
require "rails_autolink"
require "rails-observers"
require "nokogiri"
require "geokit"
require "htmlentities"
require "paper_trail"
require "ri_cal"
require "will_paginate"
require "will_paginate/array"
require "rest-client"
require "loofah"
require "loofah-activerecord"
require "bluecloth"
require "formtastic"
require "acts-as-taggable-on"
require "jquery-rails"
require "jquery-ui-rails"
require "font-awesome-rails"
require "paper_trail_manager"
require "utf8-cleaner"
require "sunspot_rails"
require "lucene_query"
require "rack/contrib/jsonp"

module Webportals
  mattr_accessor :title,
                 :tagline,
                 :url,
                 :administrator_email,
                 :admin_username,
                 :admin_password,
                 :meetup_api_key,
                 :facebook_access_token,
                 :search_engine,
                 :icalendar_sequence_offset,
                 :mapping_marker_color,
                 :mapping_google_maps_api_key,
                 :mapping_provider,
                 :mapping_tiles,
                 :venues_map_options,
                 :blacklist_patterns


  self.title ="webportals"
  self.tagline = "A Tech Calendar"
  self.url = "http://my-calagator.org/"
  self.administrator_email = "ppp8300885@gmail.com"
  self.search_engine = :sql
  self.icalendar_sequence_offset = 0
  self.admin_username="peng"
  self.admin_password="ppp"
  self.mapping_marker_color = "green"
  self.mapping_provider = "stamen"
  self.mapping_tiles = "terrain"
  self.venues_map_options = {}
  self.blacklist_patterns = [
      /\b(online|overseas).+(drugstore|pharmacy)\b/,
      /\bcialis\b/,
  ]


  def self.configure_search_engine
    kind = search_engine.try(:to_sym)

    Webportals::Event::SearchEngine.use(kind)
    Webportals::Venue::SearchEngine.use(kind)
  end

  def self.setup(&block)
    yield self
  end
end