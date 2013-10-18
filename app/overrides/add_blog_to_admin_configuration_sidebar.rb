Deface::Override.new(:virtual_path => "spree/admin/shared/_configuration_menu",
                     :name => "blog_admin_configurations_sidebar_menu",
                     :insert_bottom => "[data-hook='admin_configurations_sidebar_menu'], #admin_configurations_sidebar_menu[data-hook]",
                     :text => "<%= configurations_sidebar_menu_item t('spree.blogs.settings.blogs'), admin_blogs_path %>",
                     :disabled => false)

Deface::Override.new(:virtual_path => "spree/admin/shared/_configuration_menu",
                     :name => "blog_disqus_admin_configurations_sidebar_menu",
                     :insert_bottom => "[data-hook='admin_configurations_sidebar_menu'], #admin_configurations_sidebar_menu[data-hook]",
                     :text => "<%= configurations_sidebar_menu_item t('spree.blogs.settings.disqus'), edit_admin_disqus_settings_path %>",
                     :disabled => false)
