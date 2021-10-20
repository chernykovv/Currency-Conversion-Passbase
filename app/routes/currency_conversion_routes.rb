module CurrencyConversionRoutes
  def self.extended(base)
    base.class_exec do
      before '/rates' do
        key = params[:key]
        project = Project.find_by(api_key: key)
        if key.nil? || project.nil?
          halt 401, {'Content-Type' => 'text/plain'}, "Sorry your api key doesn't match"
        end
      end

      get '/rates' do
        uri = URI.parse('http://data.fixer.io/api/latest?access_key=80e45d5daffd7cda7ee82219248c2f1a')
        response = JSON.parse(Net::HTTP.get(uri))
        rates = response['rates']
        'Euro:' + rates['EUR'].to_s + ' and US dollar:' + rates['USD'].to_s
      end

      post '/rates/conversion' do
        uri = URI.parse('http://data.fixer.io/api/latest?access_key=80e45d5daffd7cda7ee82219248c2f1a')
        response = JSON.parse(Net::HTTP.get(uri))
        rates = response['rates']
        euro_rate = rates['EUR'].to_f
        usd_rate = rates['USD'].to_f
        params_usd = params[:usd].to_f
        params_euro = params[:euro].to_f
        if params_usd
          converted_euro = (euro_rate / usd_rate) * params_usd
          {
            'usd' => params_usd,
            'euro' => converted_euro
          }.to_json
        elsif params_euro
          converted_usd = (usd_rate / euro_rate) * params_euro
          {
            'euro' => params_euro,
            'usd' => converted_usd
          }.to_json
        end
      end
    end
  end
end
