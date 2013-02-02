set :user, "ubuntu"
set :application, "qiita_service"
set :repository,  "https://github.com/noguchi999/qiita_service.git"

set :scm, :git
set :scm_user, "noguchi999"
set :scm_password, "kp3kNNp7"

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "ec2-54-248-24-234.ap-northeast-1.compute.amazonaws.com"                  # Your HTTP server, Apache/etc
role :app, "ec2-54-248-24-234.ap-northeast-1.compute.amazonaws.com"                  # This may be ethe same as your `Web` server
role :db,  "ec2-54-248-24-234.ap-northeast-1.compute.amazonaws.com", :primary => true # This is where Rails migrations will run

set :deploy_to, "/home/ubuntu/qiita_service"

ssh_options[:keys] = %w(~/.ssh/prototype.ppm)
ssh_options[:auth_methods] = %w(publickey)
