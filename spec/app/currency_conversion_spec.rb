describe CurrencyConversion, type: :integration do
  let(:app) { CurrencyConversion.new }

  context 'projects routes' do
    context 'GET to /projects' do
      let(:response) { get '/projects' }

      before do
        p = Project.create(title: 'test')
        p.update(api_key: 'test_key')
      end

      it 'returns status 200 ok' do
        expect(response.status).to eq 200
      end

      it 'displays a list of all projects ' do
        expect(response.body).to eq([{"id": 1, "title": "test", "api_key": "test_key"}].to_json )
      end
    end

    context 'POST to /projects' do
      let(:response) { post '/projects', { title: 'test' } }

      it 'returns status 200 ok' do
        expect(response.status).to eq 200
      end

      it 'create new project ' do
        allow(SecureRandom).to receive(:hex).and_return('test_key')
        expect(response.body).to eq({"id": 1, "title": "test", "api_key": "test_key"}.to_json )
      end
    end
  end
end
