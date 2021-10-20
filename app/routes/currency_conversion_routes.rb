module CurrencyConversionRoutes
  def self.extended(base)
    base.class_exec do
      get '/rates' do
        'rates'
        # return all available rates
      end

      get '/rates/conversion' do
        # convert rate
      end
    end
  end
end
