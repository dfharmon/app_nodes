AppNodes.setup do |config|
  config.use_cancancan = false
  config.manual_add_allowed = false
  config.bootstrap_datatables = true
end

class << Rails.application
  def version
    '123'
  end

  def extended_info
    {
        test: 'one',
        test2: 'two'
    }
  end
end


