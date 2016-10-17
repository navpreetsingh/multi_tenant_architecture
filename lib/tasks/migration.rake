server_counts = YAML.load_file(Rails.root + "config/database.yml")

namespace :db do 
	desc "Migrate to all servers"
	task mass_migration: :environment do
		if Rails.env.dev?
			string = ''
			last_count = server_counts["dev_count"]
			(1..last_count).to_a.each do |n|
				string += "RAILS_ENV=dev_server_#{n} rake db:migrate"
				if(n < last_count)
					string += " && "
				end
			end
			puts string
			exec string
		elsif Rails.env.hdc?
			string = ''
			last_count = server_counts["hdc_count"]
			(1..last_count).to_a.each do |n|
				string += "RAILS_ENV=hdc_server_#{n} rake db:migrate"
				if(n < last_count)
					string += " && "
				end
			end
			puts string
			exec string
		elsif Rails.env.qa?
			string = ''
			last_count = server_counts["qa_count"]
			(1..last_count).to_a.each do |n|
				string += "RAILS_ENV=qa_server_#{n} rake db:migrate"
				if(n < last_count)
					string += " && "
				end
			end
			exec string
		elsif Rails.env.alpha?
			string = ''
			last_count = server_counts["alpha_count"]
			(1..last_count).to_a.each do |n|
				string += "RAILS_ENV=alpha_server_#{n} rake db:migrate"
				if(n < last_count)
					string += " && "
				end
			end
			exec string
		else
			puts "rake aborted! \n NameError: Please specify the correct environment!!!"
		end				
	end

	desc "Rollback from all servers"
	task :mass_rollback, [:step] => :environment do |t, args|
		if args[:step].nil? || !(args[:step].instance_of? Fixnum)
			step = 1
		else
			step = args[:step]
			if Rails.env.dev?
				string = ''
				last_count = server_counts["dev_count"]
				(1..last_count).to_a.each do |n|
					string += "RAILS_ENV=dev_server_#{n} rake db:rollback STEP=#{step}"
					if(n < last_count)
						string += " && "
					end
				end
				exec string
			elsif Rails.env.hdc?
				string = ''
				last_count = server_counts["hdc_count"]
				(1..last_count).to_a.each do |n|
					string += "RAILS_ENV=hdc_server_#{n} rake db:rollback STEP=#{step}"
					if(n < last_count)
						string += " && "
					end
				end
				exec string
			elsif Rails.env.qa?
				string = ''
				last_count = server_counts["qa_count"]
				(1..last_count).to_a.each do |n|
					string += "RAILS_ENV=qa_server_#{n} rake db:rollback STEP=#{step}"
					if(n < last_count)
						string += " && "
					end
				end
				exec string
			elsif Rails.env.alpha?
				string = ''
				last_count = server_counts["alpha_count"]
				(1..last_count).to_a.each do |n|
					string += "RAILS_ENV=alpha_server_#{n} rake db:rollback STEP=#{step}"
					if(n < last_count)
						string += " && "
					end
				end
				exec string
			else
				puts "rake aborted! \n NameError: Please specify the correct environment!!!"
			end
		end				
	end

	desc "Migrate one migration to all servers"
	task "mass_migration:up", [:version] => :environment do |t, args|
		if args[:version].nil?
			puts "rake aborted! \n NameError: Please specify the version!!!"
		else
			if Rails.env.dev?
				string = ''
				version = args[:version]
				last_count = server_counts["dev_count"]
				(1..last_count).to_a.each do |n|
					string += "RAILS_ENV=dev_server_#{n} rake db:migrate:up VERSION=#{version}"
					if(n < last_count)
						string += " && "
					end
				end
				exec string
			elsif Rails.env.hdc?
				string = ''
				last_count = server_counts["hdc_count"]
				(1..last_count).to_a.each do |n|
					string += "RAILS_ENV=hdc_server_#{n} rake db:migrate:up VERSION=#{version}"
					if(n < last_count)
						string += " && "
					end
				end
				exec string
			elsif Rails.env.qa?
				string = ''
				last_count = server_counts["qa_count"]
				(1..last_count).to_a.each do |n|
					string += "RAILS_ENV=qa_server_#{n} rake db:migrate:up VERSION=#{version}"
					if(n < last_count)
						string += " && "
					end
				end
				exec string
			elsif Rails.env.alpha?
				string = ''
				last_count = server_counts["alpha_count"]
				(1..last_count).to_a.each do |n|
					string += "RAILS_ENV=alpha_server_#{n} rake db:migrate:up VERSION=#{version}"
					if(n < last_count)
						string += " && "
					end
				end
				exec string
			else
				puts "rake aborted! \n NameError: Please specify the correct environment!!!"
			end		
		end		
	end

	desc "Rollback one migration to all servers"
	task "mass_migration:down", [:version] => :environment do |t, args|
		if args[:version].nil?
			puts "rake aborted! \n NameError: Please specify the version!!!"
		else
			if Rails.env.development?
				string = ''
				debugger
				version = args[:version]
				last_count = server_counts["dev_count"]
				(1..last_count).to_a.each do |n|
					string += "RAILS_ENV=dev_server_#{n} rake db:migrate:down VERSION=#{version}"
					if(n < last_count)
						string += " && "
					end
				end
				exec string
			elsif Rails.env.hdc?
				string = ''
				last_count = server_counts["hdc_count"]
				(1..last_count).to_a.each do |n|
					string += "RAILS_ENV=hdc_server_#{n} rake db:migrate:down VERSION=#{version}"
					if(n < last_count)
						string += " && "
					end
				end
				exec string
			elsif Rails.env.qa?
				string = ''
				last_count = server_counts["qa_count"]
				(1..last_count).to_a.each do |n|
					string += "RAILS_ENV=qa_server_#{n} rake db:migrate:down VERSION=#{version}"
					if(n < last_count)
						string += " && "
					end
				end
				exec string
			elsif Rails.env.alpha?
				string = ''
				last_count = server_counts["alpha_count"]
				(1..last_count).to_a.each do |n|
					string += "RAILS_ENV=alpha_server_#{n} rake db:migrate:down VERSION=#{version}"
					if(n < last_count)
						string += " && "
					end
				end
				exec string
			else
				puts "rake aborted! \n NameError: Please specify the correct environment!!!"
			end		
		end		
	end
end