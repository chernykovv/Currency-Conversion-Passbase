module ProjectRoutes
  def self.extended(base)
    base.class_exec do
      get '/projects' do
        # return all the projects
      end

      post '/projects' do
        # create a project
      end

      put '/project/:id' do
        # update the project
      end

      delete '/project/:id' do
        # delete the project
      end
    end
  end
end
