include_recipe 'postgresql::install_postgres'
include_recipe 'postgresql::add_launch_agent'
include_recipe 'postgresql::create_current_user_db'
include_recipe 'postgresql::create_postgres_user'
