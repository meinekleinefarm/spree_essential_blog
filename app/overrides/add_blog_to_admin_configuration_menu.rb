Deface::Override.new(:virtual_path  => "spree/admin/configurations/index",
                     :name          => "blog_admin_configurations_menu",
                     :insert_bottom => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
                     :text          => "<%= configurations_menu_item( t('spree.blogs.settings.blogs'), admin_blogs_path, t('spree.blogs.settings.explain_blogs')) %>",
                     :disabled      => false)

Deface::Override.new(:virtual_path  => "spree/admin/shared/_configuration_menu",
                    :name          => "blog_disqus_admin_configurations_menu",
                    :insert_bottom => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
                    :text          => "<%= configurations_menu_item( t('spree.blogs.settings.disqus'), edit_admin_disqus_settings_path, t('spree.blogs.settings.explain_disqus')) %>",
                    :disabled      => false)
