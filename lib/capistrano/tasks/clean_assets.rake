namespace :clean do
  desc 'Runs rake assets:clean on server'
  task :assets do
    on roles(:app) do
      within "#{current_path}" do
        with rails_env: :production do
          execute :rake, 'assets:clean'
          execute :touch, release_path.join('tmp/restart.txt')
        end
      end
    end
  end
end
