module CustomFieldSql
  module CustomFields
    module Formats

      class Sql_active < Redmine::FieldFormat::List
        add 'sql_active'
        field_attributes :sql_active
        self.form_partial = 'custom_fields/formats/sql_active'
        

        def possible_values_options(custom_field, object = nil)
          sql_active = custom_field.sql_active
          if sql_active
            if object
              if object.id.nil?
                sql_active = sql_active.gsub('%id%', 'null')
              else
                sql_active = sql_active.gsub('%id%', object.id.to_s)
              end
            end
            result = ActiveRecord::Base.connection.select_all(sql_active)
            result.rows.where("active = 1")
          else
            []
          end
        end
        
        def possible_values_records(custom_field, object=nil)
          sql_active = custom_field.sql_active
          if sql_active
            if object
              if object.id.nil?
                sql_active = sql_active.gsub('%id%', 'null')
              else
                sql_active = sql_active.gsub('%id%', object.id.to_s)
              end
            end
            result = ActiveRecord::Base.connection.select_all(sql_active)
            result.rows.where("active = 1")
          else
            []
          end
        end

        def group_statement(custom_field)
          order_statement(custom_field)
        end

        def validate_custom_field(custom_field)
          errors = []
          #errors << [:language, :blank] if custom_field.language.blank?
          errors
        end
      end

    end
  end
end
