require 'elasticsearch/model'

include Elasticsearch::Model.client = Elasticsearch::Client.new log:true, transport_options:{request:{timeout: 5}}