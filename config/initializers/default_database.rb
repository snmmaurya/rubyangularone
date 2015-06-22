default_database = :sqlite || :postgrsql

case default_database
	when :postgrsql
		databases = YAML::load(IO.read("config/postgresql_database_supports.yml"))
		ActiveRecord::Base.establish_connection databases[Rails.env]
		#user creation | migration using supports:db:create etc
	else
		#default
end
