module ProjectRoutes
  def self.extended(base)
    base.class_exec do
      before '/projects/:id' do
        key = params[:key]
        project = Project.find(params[:id])
        unless project && project.api_key == key
          halt 401, {'Content-Type' => 'text/plain'}, "Sorry your api key doesn't match"
        end
      end

      get '/projects' do
        Project.all.to_json
      end

      post '/projects' do
        title = params[:title]
        project = Project.create(title: title)
        project.to_json
      end

      put '/projects/:id' do
        project = Project.find(params[:id])
        project.update(title: params[:title])
        project.to_json
      end

      delete '/projects/:id' do
        project = Project.find(params[:id])
        project.destroy
        project.to_json
      end
    end
  end
end
