module AppNodes
  class Node < ActiveRecord::Base
    serialize :extended_info, Hash
  end
end
