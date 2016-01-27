require 'rails/generators/active_record/migration'

module UserAnnouncements
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      extend ActiveRecord::Generators::Migration
      source_root File.join(File.dirname(__FILE__), "templates")

      desc %(Copy user_announcements files.
* assumes Bootstrap by default
* if you are not using Bootstrap, see:
  * --no_bootstrap


)
 
      class_option :no_bootstrap, aliases: '-n', type: :boolean, desc: 'Do not configure for Bootstrap'
      class_option :readme, aliases: '-r', type: :boolean, desc: 'Display README and exit'

      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end
      
      def install_base_files
        return if options.readme?
        
        copy_file 'app/assets/stylesheets/user_announcements/user_announcements.css.scss'
        template  'config/initializers/user_announcements.rb'
        migration_template "migration.rb", "db/migrate/create_user_announcement_tables.rb"
      end

      def show_readme
        if behavior == :invoke
          readme "README"
        end
      end
      
    end
  end
end

