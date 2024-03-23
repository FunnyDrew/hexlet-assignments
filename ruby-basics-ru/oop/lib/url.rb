# frozen_string_literal: true

# BEGIN
require 'forwardable'
require 'uri'

class Url
  attr_accessor :link

  extend Forwardable
  include Comparable

  def initialize(adress)
    @link = URI adress
  end

  def_delegators :@link, :scheme, :host, :port

  def query_params
    return {} if link.query.nil?

    link
      .query
      .split('&')
      .each_with_object({}) do |item, acc|
      params = item.split('=')
      acc[params.first.to_sym] = params.last
    end
  end

  def query_param(key, default = nil)
    query_params.include?(key) ? query_params[key] : default
  end

  def <=>(other)
    [link.to_s.split('?').first, query_params] <=> [other.link.to_s.split('?').first, other.query_params]
  end
end
# END
