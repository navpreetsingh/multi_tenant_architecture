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
	task mass_rollback: :environment do		
		if ARGV.length == 1
			step = 1
		else
			step = ARGV[1].split("=").last
			step = 1 if step.to_i == 0
		end				
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

	desc "Migrate one migration to all servers"
	task "mass_migration:up" => :environment do 
		if ARGV.length == 1
			puts "rake aborted! \n NameError: Please specify the version!!!"
		else
			version = ARGV[1].split("=").last
			if Rails.env.dev?
				string = ''				
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
	task "mass_migration:down" => :environment do |t, args|
		if ARGV.length == 1
			puts "rake aborted! \n NameError: Please specify the version!!!"
		else
			version = ARGV[1].split("=").last
			if Rails.env.dev?
				string = ''								
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