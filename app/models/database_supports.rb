module DatabaseSupports
	# class PostgreSQL < ActiveRecord::Base
	# 	databases = YAML::load(IO.read("config/postgresql_database_supports.yml"))
	# 	establish_connection databases[Rails.env]
	# end

	# class Oracle < ActiveRecord::Base
	# 	databases = YAML::load(IO.read("config/postgresql_database_supports.yml"))
	# 	establish_connection databases[Rails.env]
	# end

	# class MYSQL < ActiveRecord::Base
	# 	databases = YAML::load(IO.read("config/postgresql_database_supports.yml"))
	# 	establish_connection databases[Rails.env]
	# 	# establish_connection "postgresql_#{Rails.env}"
	# end

	def self.current_database
		databases = YAML::load(IO.read("config/postgresql_database_supports.yml"))
		databases[Rails.env]
	end
end