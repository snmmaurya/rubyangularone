namespace :support do
	# desc "Configure the variables that rails need in order to look up for the db
	# configuration in a different folder"
	task :set_custom_db_config_paths do
		# This is the minimum required to tell rails to use a different location
		# for all the files related to the database.
		ENV['SCHEMA'] = 'postgresql_database_supports/schema.rb'
		Rails.application.config.paths['db'] = ['postgresql_database_supports']
		Rails.application.config.paths['db/migrate'] = ['postgresql_database_supports/migrate']
		#Rails.application.config.paths['db/seeds'] = ['postgresql_database_supports/seeds.rb']  # for Rails-3
		Rails.application.config.paths['db/seeds.rb'] = ['postgresql_database_supports/seeds.rb'] # for Rails-4
		Rails.application.config.paths['config/database'] = ['config/postgresql_database_supports.yml']
	end

	namespace :db do
		task :drop => :set_custom_db_config_paths do
			Rake::Task["db:drop"].invoke
		end

		task :create => :set_custom_db_config_paths do
			Rake::Task["db:create"].invoke
		end

		task :migrate => :set_custom_db_config_paths do
			Rake::Task["db:migrate"].invoke
		end

		task :rollback => :set_custom_db_config_paths do
			Rake::Task["db:rollback"].invoke
		end

		task :seed => :set_custom_db_config_paths do
			Rake::Task["db:seed"].invoke
		end
		
		namespace :test do
		task :prepare => :set_custom_db_config_paths do
			Rake::Task["db:test:prepare"].invoke
		end
		end

		task :version => :set_custom_db_config_paths do
			Rake::Task["db:version"].invoke
		end
	end
end