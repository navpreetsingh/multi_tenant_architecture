class AddAddressTable < ActiveRecord::Migration
  def up
  	execute <<-SQL
      CREATE TABLE `addresses` (
			  `id` int(11) NOT NULL,
			  `user_id` int(11) DEFAULT NULL,
			  `first_line` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `second_line` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `third_line` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `district` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `pincode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `created_at` datetime NOT NULL,
			  `updated_at` datetime NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

    SQL

    execute <<-SQL
  		ALTER TABLE `addresses`
			  ADD PRIMARY KEY (`id`),
			  ADD KEY `index_addresses_on_user_id` (`user_id`);
    SQL

    execute <<-SQL
  		ALTER TABLE `addresses`
  			MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
    SQL

    execute <<-SQL
  		ALTER TABLE `addresses`
  			ADD CONSTRAINT `fk_rails_48c9e0c5a2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
    SQL
  end

  def down
  	DROP TABLE `addresses`;
  end
end
