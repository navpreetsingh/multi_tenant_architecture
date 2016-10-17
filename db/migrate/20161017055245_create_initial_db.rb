class CreateInitialDb < ActiveRecord::Migration
  def up    
  	execute <<-SQL
      SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
    SQL

  	execute <<-SQL
  		SET time_zone = "+00:00";
    SQL
      
    execute <<-SQL  
	      CREATE TABLE `users` (
			  `id` int(11) NOT NULL,
			  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `age` int(11) DEFAULT NULL,
			  `gender` int(11) DEFAULT NULL,
			  `created_at` datetime NOT NULL,
			  `updated_at` datetime NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
    SQL

    execute <<-SQL
  		ALTER TABLE `users`
  			ADD PRIMARY KEY (`id`);
    SQL

    execute <<-SQL
  		ALTER TABLE `users`
  			MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
    SQL
  end

  def down
  	execute <<-SQL
  		DROP TABLE `users`;
    SQL
  end
end
