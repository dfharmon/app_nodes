require 'builder'
module AppNodes
  module NodesHelper
    def hash_to_html( data )
      xm = Builder::XmlMarkup.new(:indent => 2)
      xm.table do
        data.each do |row|
          xm.tr do
            xm.td(row.first.to_s + ':')
            xm.td(row.last.to_s)
          end
        end
      end
    end
  end
end
